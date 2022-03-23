class CreateJoinTables < ActiveRecord::Migration[6.1]
  def change
    create_table :album_genres do |t|
      t.integer :album_id
      t.integer :genre_id
    end

    create_table :playlist_tracks do |t|
      t.integer :playlist_id
      t.integer :track_id
    end
  end
end
