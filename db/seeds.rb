require_relative "../config/environment.rb"

puts "Seeding..."

# Import hard-coded Spotify artist id's
artist_spotify_ids = YAML.parse_file("spotify_ids.yaml").map(&:transform)

artist_spotify_ids.map do |id|
  s_artist = RSpotify::Artist.find(id)
  s_albums = s_artist.albums

  # Create artist
  artist = Artist.find_or_create_by(spotify_id: s_artist.id)
  artist_attributes = {
    name: s_artist.name,
    popularity: s_artist.popularity,
    img_url: s_artist.images.last["url"],
  }
  artist.attributes = artist.attributes.merge artist_attributes
  artist.save

  # Create all albums for artist
  s_albums.each do |s_album|
    album = Album.find_or_create_by(spotify_id: s_album.id)
    album_attributes = {
      artist_id: artist.id,
      name: s_album.name,
      img_url: s_album.images.last["url"],
      release_date: s_album.release_date,
    }
    album.attributes = album.attributes.merge album_attributes
    album.save

    # Create all tracks for each album by the artist
    tracks = s_album.tracks
    tracks.each do |s_track|
      track = Track.find_or_create_by(spotify_id: s_track.id)
      track_attributes = {
        album_id: album.id,
        name: s_track.name,
        duration_s: (s_track.duration_ms / 1000),
      }
      track.attributes = track.attributes.merge track_attributes
      track.save
    end
  end

  total_albums = artist.albums.size
  total_tracks = artist.albums.map { |a| a.tracks.size }.flatten.sum

  puts "Created artist '#{artist.name}' with #{total_albums} albums & #{total_tracks} total tracks"
end

puts "Seeding done!"
