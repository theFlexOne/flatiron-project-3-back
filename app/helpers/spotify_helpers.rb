class SpotifyAPI
  RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
  attr_reader :user, :playlists, :playlist_tracks

  def initialize(id = ENV["MY_SPOTIFY_USER_ID"])
    @user = RSpotify::User.find(id)
  end

  def playlists
    @playlists ||= @user.playlists
  end

  def playlist_tracks
    @playlist_tracks ||= self.playlists.map do |p|
      { playlist_id: p.id, tracks: p.tracks }
    end
  end
end
