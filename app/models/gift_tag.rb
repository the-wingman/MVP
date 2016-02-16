class GiftTag < ActiveRecord::Base
  belongs_to :gift
  belongs_to :tag
  validates_uniqueness_of :tag, scope: :gift
end
