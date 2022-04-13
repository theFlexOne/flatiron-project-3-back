class PlaylistTracksController < ApplicationController
  post "/playlist_tracks" do
    playlist_id = Playlist.find(params[:playlist_id]).id
    track_id = Track.find(params[:track_id]).id
    duplicate = params[:duplicate] == "true"
    playlist_track = PlaylistTrack.find_by(playlist_id: playlist_id, track_id: track_id)
    if (!playlist_track.nil? && duplicate) || playlist_track.nil?
      playlist_track = PlaylistTrack.create(playlist_id: playlist_id, track_id: track_id)
    end

    return playlist_track.to_json
  rescue ActiveRecord::RecordNotFound => err
    body << err.message
    not_found(body)
  end

  delete "/playlist_tracks" do
    playlist_id = Playlist.find(params[:playlist_id]).id
    track_id = Track.find(params[:track_id]).id
    playlist_track = PlaylistTrack.find_by(playlist_id: playlist_id, track_id: track_id)
    if playlist_track.nil?
      return { ok: false, message: "Track ID: #{track_id} was not found in playlist ID: #{playlist_id}" }.to_json
    end
    playlist_track.delete
    return { ok: true, message: "Track ID: #{track_id} was deleted from playlist ID: #{playlist_id}" }.to_json
  rescue ActiveRecord::RecordNotFound => err
    body << err.message
    not_found(body)
  end
end
