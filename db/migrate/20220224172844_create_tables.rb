class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :spotify_id
      t.integer :popularity
    end
    create_table :albums do |t|
      t.string :name
      t.string :spotify_id
      t.datetime :release_date
    end
    create_table :tracks do |t|
      t.string :name
      t.string :spotify_id
      t.integer :duration_s
    end
    create_table :genres do |t|
      t.string :name
      t.string :spotify_id
    end
    create_table :playlists do |t|
      t.string :name
      t.string :spotify_id
    end
  end
end
