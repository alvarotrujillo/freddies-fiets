class ChangeColumnToBikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :bikes, :type, :bike_type
  end
end
