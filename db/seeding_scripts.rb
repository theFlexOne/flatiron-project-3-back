def fill_out_existing_albums
  album_spotify_ids = Album.pluck :spotify_id

  # loop through ids, creating any tracks that doesn't already exist
  album_spotify_ids.each do |id|
    s_album = RSpotify::Album.find(id)
    s_album.tracks.each do |t|
      track = Track.find_or_create_by(spotify_id: t.id)
      track.update(name: t.name, album_id: s_album.id, duration_s: t.duration_ms / 1000)
      p "Created track \"#{track.name}\", belonging to album \"#{s_album.name}\""
    end
    p "Album \"#{s_album.name}\" filled out and now has #{s_album.tracks.size} track(s)"
  end
end

fill_out_existing_albums()
