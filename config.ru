require_relative "./config/environment"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

user = RSpotify::User.find ENV["MY_SPOTIFY_USER_ID"]
playlists = user.playlists

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

use TracksController
use PlaylistsController
use ArtistsController
# use AlbumsController
use PlaylistTracksController
run ApplicationController
