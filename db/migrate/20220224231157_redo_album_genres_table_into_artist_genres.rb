class RedoAlbumGenresTableIntoArtistGenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :album_genres, :album_id
    add_column :album_genres, :artist_id, :integer
    rename_table :album_genres, :artist_genres
  end
end
