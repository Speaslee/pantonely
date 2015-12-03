class AddMovieToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :movie, :string
  end
end
