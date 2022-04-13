require_relative "../helpers/controller_helpers.rb"

module Serializers
  include ControllerHelpers

  ARTIST_SERIALIZER = {
    only: [:id, :name, :img_url],
    include: {
      albums: {
        only: [:id, :name, :img_url, :release_date],
      },
    },
  }

  ALBUM_SERIALIZER = {
    only: [:id, :name, :img_url, :release_date],
    include: {
      tracks: {
        only: [:id, :name, :duration_s],
        methods: [:duration],
      },
      artist: {
        only: [:id, :name, :img_url],
      },
    },
  }

  TRACK_SERIALIZER = {
    only: [:id, :name, :duration_s],
    methods: [:duration],
    include: {
      album: {
        only: [:id, :name, :img_url, :release_date],
      },
      artist: {
        only: [:id, :name],
      },
      playlists: {
        only: [:id, :name, :img_url],
      },
    },
  }

  PLAYLIST_SERIALIZER = {
    only: [:id, :name, :img_url],
    include: {
      tracks: {
        only: [:id, :name, :duration_s],
        methods: [:duration],
        include: {
          album: { only: [:id, :name, :img_url], methods: [:album_release_date] },
          artist: { only: [:id, :name, :img_url] },
        },
      },
    },
  }
end
