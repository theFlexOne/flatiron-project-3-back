require_relative "../helpers/controller_helpers.rb"
require_relative "../constants/serializers.rb"

# def

class PlaylistsController < ApplicationController
  include ControllerHelpers
  include Serializers

  get "/playlists" do
    @playlists = Playlist.all
    @playlists.to_json PLAYLIST_SERIALIZER
  end

  get "/playlists/:id" do |id|
    @playlist = Playlist.find_by(id: id) || {} # -> {} instead of null
    @playlist.to_json PLAYLIST_SERIALIZER
  end

  post "/playlists/:playlist_id/tracks/:track_id" do
    track = Track.find params[:track_id]
    playlist = Playlist.find params[:playlist_id]
    ids = { playlist_id: playlist.id, track_id: track.id }
    PlaylistTrack.create(ids)

    track.to_json(TRACK_SERIALIZER)
  end

  delete "/playlists/:playlist_id/tracks/:track_id" do |pID, tID|
    playlist = Playlist.find(pID)
    track = Track.find(tID)

    PlaylistTrack.delete_by playlist_id: playlist.id, track_id: track.id

    "Removed \"#{track.name}\" from playlist \"#{playlist.name}\""
  rescue ActiveRecord::RecordNotFound => err
    body << err.message
    not_found(body)
  end
end
