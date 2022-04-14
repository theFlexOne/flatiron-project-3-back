require_relative "../config/environment.rb"

puts "Seeding..."

# Import hard-coded Spotify artist id's
spotify_ids = YAML.load_file("spotify_ids.yaml")

spotify_playlists_ids = spotify_ids[:playlists]

spotify_playlists_ids.each do |id|
  s_playlist = RSpotify::Playlist.find(ENV["MY_SPOTIFY_USER_ID"], id)
  s_track_ids = s_playlist.tracks.map(&:id)

  img_url = !s_playlist.images.empty? ? s_playlist.images.first["url"] : ""
  db_playlist = Playlist.find_or_create_by(name: s_playlist.name, spotify_id: s_playlist.id, img_url: img_url)

  s_track_ids.each do |id|
    s_track = RSpotify::Track.find(id)
    s_album = s_track.album
    s_artist = s_track.artists.first

    db_artist = Artist.find_or_create_by(name: s_artist.name, spotify_id: s_artist.id, img_url: s_artist&.images&.first["url"] || "", popularity: s_artist.popularity)
    db_album = Album.find_or_create_by(name: s_album.name, spotify_id: s_album.id, img_url: s_album&.images&.first["url"] || "", release_date: s_album.release_date, artist_id: db_artist.id)
    db_track = Track.find_or_create_by(name: s_track.name, spotify_id: s_track.id, duration_s: s_track.duration_ms / 1000, album_id: db_album.id)

    PlaylistTrack.create(playlist_id: db_playlist.id, track_id: db_track.id)
  end
  p "created #{db_playlist.name} with #{db_playlist.albums.size} albums & #{db_playlist.tracks.size} tracks"
end

puts "Seeding done!"
