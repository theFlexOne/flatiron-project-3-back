class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :playlists, through: :tracks

  def album_release_date
    self.release_date&.to_date.to_s || ""
  end
end
