class TracksController < ApplicationController
  get "/tracks/search?" do
    text = params[:text]
    filter = params[:filter]

    if filter == "name"
      Track.where("name LIKE '%#{text}%'").to_json(TRACK_SERIALIZER)
    elsif filter == "album"
      Track.joins("album").where("album.name LIKE '%#{text}%'")
    end
  end
end
