class Legacy < ApplicationRecord
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_many :memories
	has_many :comments

	def self.search(search)
	  where("lower(name) LIKE ? OR lower(state) LIKE ? OR lower(city) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
