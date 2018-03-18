class Legacy < ApplicationRecord
	has_attached_file :photo
	validates_attachment :photo, content_type: { content_type: "image/jpeg" }
	belongs_to :user
	has_many :memories

  def country_name
    country = ISO3166::Country[country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
