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

  def album_img_url
    return self.album&.img_url || ""
  end

  def duration
    return nil if self.duration_s.nil?
    formattedDuration = seconds_to_time_display(self.duration_s)
  end
end
