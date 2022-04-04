require_relative "../helpers/controller_helpers.rb"

class Track < ActiveRecord::Base
  include ControllerHelpers
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks
  belongs_to :album
  has_one :artist, through: :album

  def genres
    self.artist.genres
  end

  def duration
    if self.duration_s.nil?
      return
    end
    formattedDuration = seconds_to_time_display(self.duration_s)
  end
end
