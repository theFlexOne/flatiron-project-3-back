class Artist < ActiveRecord::Base
  has_many :albums
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :tracks, through: :albums
  has_many :playlists, through: :tracks
end
