require_relative "../config/environment.rb"

puts "Seeding..."

album_ids = YAML.parse_file("spotify_ids.yaml").to_ruby

album_ids.each do |id|
  album = RSpotify::Album.find(id)

  # grabbing the spotify ids
  track_ids = album.tracks.map(&:id)
  artist_id = album.artists.first.id

  # creating artist
  Artist.find_or_create_by(spotify_id: artist_id)

  # creating tracks
  track_ids.each do |id|
    Track.find_or_create_by(spotify_id: id)
  end

  binding.pry
end

# binding.pry

puts "Seeding done!"
