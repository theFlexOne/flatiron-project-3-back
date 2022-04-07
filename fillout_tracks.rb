require_relative "./config/environment.rb"

tracks = Track.all

def create_track_album(track)
  s_track = RSpotify::Track.find(track.spotify_id)
  s_album = s_track.album
  album = Album.create(spotify_id: s_album.id, name: s_album.name, img_url: s_album.images&.last["url"])
  binding.pry
end

create_track_album(tracks.sample)
