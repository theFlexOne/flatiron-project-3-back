require_relative "../config/environment.rb"

puts "Seeding..."

# Import hard-coded Spotify artist id's
spotify_ids = YAML.load_file("spotify_ids.yaml")

artist_spotify_ids = spotify_ids[:artists]
playlist_spotify_ids = spotify_ids[:playlists]

# Seeding music from Spotify with a list of Spotify artist ids
artist_spotify_ids.each do |id|
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

# Seeding my playlists from Spotify with a list of my Spotify playlist ids
playlist_spotify_ids.each do |id|

  # find playlist in spotify
  s_playlist = RSpotify::Playlist.find(ENV["MY_SPOTIFY_USER_ID"], id)

  # find or create playlist in db
  playlist = Playlist.find_or_create_by(spotify_id: s_playlist.id)

  # fill in playlist attributes with spotify data
  img_url = s_playlist.images.first["url"] unless s_playlist.images.empty?
  playlist_attributes = {
    name: s_playlist.name,
    img_url: img_url,
  }
  playlist.attributes = playlist.attributes.merge playlist_attributes

  # get all tracks for playlist from spotify
  s_playlist.tracks.each do |s_track|

    # find or create track in db
    track = Track.find_or_create_by(spotify_id: s_track.id)

    # fill in track attributes with spotify data
    track_attributes = {
      name: s_track.name,
      duration_s: (s_track.duration_ms / 1000),
    }
    track.attributes = track.attributes.merge track_attributes

    # save changes to track
    track.save

    # save track to playlist
    PlaylistTrack.find_or_create_by(track_id: track.id, playlist_id: s_playlist.id)
  end

  # save changes to playlist
  playlist.save
  puts "Created playlist #{playlist.name} with #{playlist.tracks.size} tracks"
end

puts "Seeding done!"
