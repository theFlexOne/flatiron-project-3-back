class CreateTableAssociations < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :genre_id, :integer
    add_column :tracks, :album_id, :integer
    add_column :tracks, :playlist_id, :integer

    add_column :albums, :artist_id, :integer
  end
end
