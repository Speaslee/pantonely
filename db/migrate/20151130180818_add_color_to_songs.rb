class AddColorToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :color, :string
  end
end
