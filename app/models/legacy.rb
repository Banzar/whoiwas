class Legacy < ApplicationRecord
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_many :memories
	has_many :comments

	def self.search(search)
	  where("name LIKE ? OR state LIKE ? OR city LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
