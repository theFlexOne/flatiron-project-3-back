require "dotenv/load"
ENV["RACK_ENV"] ||= "development"

# Require in Gems
require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

# Require in all files in 'app' directory
require_all "app"

RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
