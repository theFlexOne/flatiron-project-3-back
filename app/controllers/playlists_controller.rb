require_relative "../helpers/controller_helpers.rb"
require_relative "../constants/serializers.rb"

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

  get "/playlists/:id/tracks" do |id|
  end
end
