require_relative "./application_controller.rb"

class AlbumsController < ApplicationController
  get "/albums" do
    albums = Album.all
    albums.to_json(include: :tracks)
  end
end
