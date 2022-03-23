include "./application_controller.rb"

class ArtistsController < ApplicationController
  get "/artists" do
    artists = Artist.all
    artists.to_json(:include => { :albums => { :include => :tracks } })
  end

  get "/artists/:id" do |id|
    artist = Artist.find_by(id: id) || {}
    artist.to_json
  end
end
