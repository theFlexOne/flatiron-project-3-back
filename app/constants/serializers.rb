require_relative "../helpers/controller_helpers.rb"

module Serializers
  include ControllerHelpers

  ARTIST_SERIALIZER = {
    only: [:id, :name, :img_url],
  }

  ALBUM_SERIALIZER = {
    only: [:id, :name, :img_url],
    include: { artist: ARTIST_SERIALIZER },
  }

  TRACK_SERIALIZER = {
    only: [:id, :name, :duration_s],
    methods: [:duration],
    include: { album: ALBUM_SERIALIZER },
  }

  PLAYLIST_SERIALIZER = {
    only: [:id, :name, :img_url],
    include: { tracks: TRACK_SERIALIZER },
  }
end
