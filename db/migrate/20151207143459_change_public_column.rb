class ChangePublicColumn < ActiveRecord::Migration
  def change
    change_column_default :songs, :public?, false
  end
end
