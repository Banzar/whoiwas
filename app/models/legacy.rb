class Legacy < ApplicationRecord
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_many :memories

  def country_name
    country = ISO3166::Country[country]
    country.translations[I18n.locale.to_s] || country.name
  end

end
