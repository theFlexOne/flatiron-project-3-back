require_relative "../helpers/controller_helpers.rb"

class ArtistsController < ApplicationController
  include ControllerHelpers

  get "/artists" do
    artists = Artist.all
    artists.to_json(:include => { :albums => { :include => :tracks } })
  end

  get "/artists/:id" do |id|
    artist = Artist.find_by(id: id) || {}

    tracks = build_tracks(artist.tracks)
    albums = build_albums(artist.albums)

    data = {
      id: artist.id,
      name: artist.name,
      albums: albums,
      tracks: tracks,
    }

    data.to_json
  end
end
