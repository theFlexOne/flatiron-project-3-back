class RemoveFksFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tracks, :genre_id
    remove_column :tracks, :playlist_id
  end
end
