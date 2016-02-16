class CreateGiftPropositions < ActiveRecord::Migration
  def change
    create_table :gift_propositions do |t|
      t.string :name
      t.string :url
      t.text :description
      t.text :comment
      t.float :price
      t.string :brand_name

      t.timestamps null: false
    end
  end
end
