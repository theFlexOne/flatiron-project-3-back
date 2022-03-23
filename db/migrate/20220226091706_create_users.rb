class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :spotify_id
      t.string :username
      t.string :spotify_url
    end

    add_column :playlists, :user_id, :integer
  end
end
