class PlaylistsController < ApplicationController
  get "/playlists" do
    playlists = Playlist.all
    playlists.to_json(include: :tracks)
  end

  get "/playlists/:id" do |id|
    playlist = Playlist.find_by(id: id) || {}
    playlist.to_json(include: :tracks)
  end
end
