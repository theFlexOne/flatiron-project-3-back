require "dotenv/load"
ENV["RACK_ENV"] ||= "development"

# Require in Gems
require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

# Require in all files in 'app' directory
require_all "app"

client_id = ENV["SPOTIFY_CLIENT_ID"]
client_secret = ENV["SPOTIFY_CLIENT_SECRET"]
# RSpotify.authenticate(client_id, client_secret)
