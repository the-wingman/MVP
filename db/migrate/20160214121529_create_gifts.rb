class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.boolean :experience, null:false
      t.string :url, null:false
      t.string :image_url
      t.text :description
      t.text :comment
      t.decimal :min_price, precision: 2
      t.decimal :max_price, precision: 2
      t.boolean :shipping_available
      t.decimal :shipping_price, precision: 2
      t.integer :shipping_time
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
