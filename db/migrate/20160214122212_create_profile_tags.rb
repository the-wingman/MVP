class CreateProfileTags < ActiveRecord::Migration
  def change
    create_table :profile_tags do |t|
      t.references :profile, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false
      t.float :value, default: 1

      t.timestamps null: false

      t.index [:profile_id, :tag_id], unique: true
    end
  end
end
