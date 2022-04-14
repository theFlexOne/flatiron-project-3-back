module SeedingScripts
  def fill_out_existing_albums
    album_spotify_ids = Album.pluck :spotify_id

    # loop through ids, creating any tracks that doesn't already exist
    Album.all.each do |album|
      s_album = RSpotify::Album.find(album.spotify_id)
      s_album.tracks.each do |t|
        track = Track.find_by spotify_id: t.id
        track ||= Track.create(spotify_id: t.id, name: t.name, duration_s: t.duration_ms / 1000, album_id: album.id)
      end
      p "Album \"#{album.name}\" filled out and now has #{album.tracks.size} track(s)"
    end
  end
end
