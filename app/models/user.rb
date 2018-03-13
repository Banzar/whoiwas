class User < ApplicationRecord
	before_save { email.downcase! }

	validates :name, presence: true, length: {maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 255},
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }
	

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	has_many :legacies

	has_attached_file :avatar
	
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
