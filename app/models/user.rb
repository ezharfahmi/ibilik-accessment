class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true, format: { :with => /\w+(.)*\w+@\w+(.)*\w+/}

	has_many :properties
	has_many :comments
	
end