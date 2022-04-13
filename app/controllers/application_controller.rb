require_relative "../constants/serializers.rb"

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  include Serializers

  get "/" do
    {
      endpoints: {
        playlists: [
          "/playlists",
          "/playlists/:id",
          "/playlists/:id/tracks",
        ],
        albums: [
          "/albums",
          "/albums/:id",
          "/albums/:id/tracks",
        ],
      },
    }.to_json
  end

  # ----------------------------------------------
  # Should be in seperate controller file.
  get "/albums" do
    @albums = Album.all
    @albums.to_json ALBUM_SERIALIZER
  end

  get "/albums/:id" do |id|
    album = Album.find_by(id: id)
    album.to_json ALBUM_SERIALIZER
  end
end
