class TracksController < ApplicationController
  get "/tracks" do
    limit = (params[:limit] || 50).to_i
    offset = (params[:offset] || 0).to_i

    tracks = Track.where(["id BETWEEN ? AND ?", offset + 1, (offset + limit)])
    tracks.to_json TRACK_SERIALIZER
  end

  get "/tracks/:id" do
    track = Track.find_by id: params[:id] || {}
    track.to_json TRACK_SERIALIZER
  end

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
