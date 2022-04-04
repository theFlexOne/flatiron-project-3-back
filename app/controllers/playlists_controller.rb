require_relative "../helpers/controller_helpers.rb"

class PlaylistsController < ApplicationController
  include ControllerHelpers

  get "/playlists" do
    playlists = Playlist.includes(:tracks => :album)
    data = playlists.map do |playlist|
      {
        id: playlist.id,
        name: playlist.name,
        img_url: playlist.img_url,
        tracks: build_tracks(playlist.tracks),
      }
    end

    data.to_json()
  end

  get "/playlists/:id" do |id|
    playlist = Playlist.find_by(id: id) || {} # -> {} instead of null
    playlist_duration_s = playlist.tracks.map(&:duration_s).sum

    duration = seconds_to_time_display(playlist_duration_s)

    tracks = build_tracks(playlist.tracks)
    data =
      {
        id: playlist.id,
        name: playlist.name,
        img_url: playlist.img_url,
        tracks: tracks,
        duration: duration,
      }

    json_data = data.to_json(include: :tracks)
    json_data
  end

  post "/playlists/:id/:track_id" do |id, track_id|
    begin
      playlist = Playlist.find(id)
      playlist.add_track_id(track_id)
      response.body = playlist.track_ids.to_json
    rescue
      response.body = "Error!!!!!"
      response.status = 400
    end
  end

  delete "/playlists/:id/:track_id" do |id, track_id|
    Playlist.remove_track(id, track_id)
  end
end
