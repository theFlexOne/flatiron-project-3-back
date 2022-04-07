class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    redirect "/models"
  end

  get "/albums" do
    albums = Album.all
    # data = albums.map do |album|
    #   {
    #     id: album.id,
    #     name: album.name,
    #     artist: album.artist.name,
    #     img_url: album.img_url,
    #     release_date: album.release_date,
    #     tracks: album.tracks,
    #   }
    # end
    # data.to_json()
    albums.to_json
  end

  get "/albums/:id" do |id|
    # binding.pry
    album = Album.find_by(id: id)
    tracks = build_tracks(album.tracks)
    data = {
      id: album.id,
      name: album.name,
      artist: {
        id: album.artist.id,
        name: album.artist.name,
        img_url: album.artist.img_url,
      },
    }
    data.to_json
  end
end
