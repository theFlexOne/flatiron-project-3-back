class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    redirect "/models"
  end

  get "/models" do
    [
      { endpoint: "/playlists", label: "Playlists" },
      { endpoint: "/artists", label: "Artists" },
      { endpoint: "/albums", label: "Albums" },
      { endpoint: "/tracks", label: "Tracks" },
    ].to_json
  end

  post "/test" do |req|
    puts req
    "TEST POST RECIEVED!!!"
  end
end
