class User < ActiveRecord::Base
	has_many :gifts
	has_many :profiles, dependent: :destroy
	has_secure_password

    validates :email, presence: true, uniqueness: true
end
