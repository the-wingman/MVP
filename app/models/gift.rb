class Gift < ActiveRecord::Base
  belongs_to :brand
  belongs_to :user
  has_many :gift_tags
  validates_uniqueness_of :name
  validates_uniqueness_of :url
end
