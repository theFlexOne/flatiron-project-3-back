class Playlist < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks
  has_many :albums, through: :tracks
  has_many :artists, through: :albums
  has_many :genres, through: :artists
  belongs_to :user

  def self.create_and_add_track(playlist, attr)
    playlist = (playlist.class == Integer) ? Playlist.find(playlist) : playlist
    playlist.tracks.create(attr)
  end

  def self.remove_track(playlist, track)
    # TODO do PlaylistTrack thing
    playlist = (playlist.class == Integer) ? Playlist.find(playlist) : playlist
    playlist.tracks.delete(track)
  end

  def self.add_track_id(playlist, track_id)
    # TODO do PlaylistTrack thing
    playlist.track_ids = [*playlist.track_ids, track_id]
  end

  def add_track_id(track_id)
    # Playlist.add_track_id(self, track_id)
    PlaylistTrack.create(playlist_id: self.id, track_id: track_id)
  end

  def add_track_by(attr)
    track = Track.find_by(attr)
    Playlist.add_track(self, track)
  end

  def remove_track(t)
    return Error unless t.class == Track || t.class == Integer
    self.tracks.delete(t)
  end

  def remove_duplicate_tracks
    tracks = self.tracks.uniq
    self.tracks = tracks
  end
end
