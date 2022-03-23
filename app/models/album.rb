class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :playlists, through: :tracks

  def genres
    self.artist.genres
  end
end
