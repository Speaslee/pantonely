class RemovePublicFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :public?, :boolean
  end
end
