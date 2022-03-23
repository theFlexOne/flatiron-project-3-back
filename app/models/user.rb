class User < ActiveRecord::Base
  has_many :playlists
  has_many :tracks, through: :playlists
  has_many :albums, through: :tracks
  has_many :artists, through: :albums
  has_many :genres, through: :artists

  def self.build_model_params(id = nil)
    user = RSpotify::User.find(id)
    {
      username: user.display_name,
      spotify_id: user.id,
      spotify_url: user.external_urls["spotify"],
    }
  end
end
