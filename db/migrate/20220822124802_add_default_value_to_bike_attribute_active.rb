class AddDefaultValueToBikeAttributeActive < ActiveRecord::Migration[7.0]
  def change
    change_column :bikes, :active, :boolean, default: true
  end
end
