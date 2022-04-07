module ControllerHelpers
  def build_track(track)
    {
      id: track.id,
      name: track.name,
      artist: {
        id: track.artist&.id || nil,
        name: track.artist&.name || "",
        img_url: track.artist&.img_url || "",
      },
      album: {
        id: track.album&.id || nil,
        name: track.album&.name || "",
        img_url: track.album&.img_url || "",
      },
      duration: track.duration || nil,
    }
  end

  def build_tracks(tracks)
    tracks.map do |track|
      build_track(track)
    end
  end

  def build_albums(albums)
    albums.map do |album|
      {
        id: album.id,
        name: album.name,
        tracks: build_tracks(album.tracks),
      }
    end
  end

  def seconds_to_time_display(seconds)
    hh = (seconds / 3600).to_s
    mm = ((seconds % 3600) / 60).to_s
    ss = (seconds % 60).to_s

    segments = [hh, mm, ss].filter { |t| t != "0" }
    formatted_segments = segments.map do |seg|
      if seg.size == 2
        seg
      else
        "0#{seg}"
      end
    end

    formatted_segments.join(":")
  end
end
