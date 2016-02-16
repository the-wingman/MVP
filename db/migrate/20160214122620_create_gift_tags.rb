class CreateGiftTags < ActiveRecord::Migration
  def change
    create_table :gift_tags do |t|
      t.references :gift, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false
      t.float :value

      t.timestamps null: false

      t.index [:gift_id, :tag_id], unique: true
    end
  end
end
