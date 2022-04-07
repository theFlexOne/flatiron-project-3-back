module SeedHelpers
  def get_tracks_from_spotify(user_id, playlist_id)
  end

  def fill_playlist(playlist, tracks)
    tracks.each do |track|
      PlaylistTrack.create(playlist_id: playlist.id, track_id: track.id)
    end
  end
end

# binding.pry
