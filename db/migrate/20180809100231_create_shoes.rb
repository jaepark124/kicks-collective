class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.string :thumb_url
      t.string :brand

      t.timestamps
    end
  end
end
