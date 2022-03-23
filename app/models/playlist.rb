class Playlist < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks
  has_many :albums, through: :tracks
  has_many :artists, through: :albums
  has_many :genres, through: :artists
  belongs_to :user

  # def self.by_user(id)
  #   RSpotify::User.find(id)
  # end

end
