class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :type
      t.string :location
      t.text :description
      t.string :gears
      t.boolean :hand_brakes
      t.integer :price
      t.boolean :active

      t.timestamps
    end
  end
end
