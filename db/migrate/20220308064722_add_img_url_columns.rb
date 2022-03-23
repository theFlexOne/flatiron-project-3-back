class AddImgUrlColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :img_url, :string
    add_column :artists, :img_url, :string
    add_column :albums, :img_url, :string
  end
end
