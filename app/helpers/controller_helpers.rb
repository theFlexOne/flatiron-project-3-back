module ControllerHelpers
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
