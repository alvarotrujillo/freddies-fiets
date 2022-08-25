class AddCoordinatesToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :latitude, :float
    add_column :bikes, :longitude, :float
  end
end
