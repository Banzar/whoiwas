class Legacy < ApplicationRecord

	belongs_to :user
	has_many :memories

  def country_name
    country = ISO3166::Country[country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
