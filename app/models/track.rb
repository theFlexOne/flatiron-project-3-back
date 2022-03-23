class Track < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks
  belongs_to :album
  has_one :artist, through: :album

  def genres
    self.artist.genres
  end

  def duration
    minutes = (self.duration_s / 60).to_s
    seconds = (self.duration_s % 60).to_s
    if seconds.length === 1
      seconds = "0" + seconds
    end
    "#{minutes}:#{seconds}"
  end
end
