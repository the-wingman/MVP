class AddCategoryToProfileTags < ActiveRecord::Migration
  def change
    add_column :profile_tags, :category, :string
  end
end
