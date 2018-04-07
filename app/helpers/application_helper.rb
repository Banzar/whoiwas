module ApplicationHelper
	def us_states
		CS.states(:us)
	end
	def tn_cities
		CS.cities(:tn, :us)		
	end
end
