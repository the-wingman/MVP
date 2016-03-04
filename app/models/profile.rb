class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_tags, dependent: :destroy

  def get_tags
    tags = []
    self.profile_tags.each do |tag|
      tag.value > 0 ? (tags << Tag.find(tag.tag_id).name) : nil
    end
    tags
  end

end
