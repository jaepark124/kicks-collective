class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :price
      t.string :main_image
      t.string :thumb_image
      t.string :brand

      t.timestamps
    end
  end
end
