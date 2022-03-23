class Genre < ActiveRecord::Base
  has_many :artist_genres
  has_many :artists, through: :artist_genres
  has_many :albums, through: :artists
  has_many :tracks, through: :albums
  has_many :playlists, through: :tracks
end
