class AddPublicToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :public?, :boolean
  end
end
