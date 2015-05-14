class Measure < ActiveRecord::Base
	# Validations
	validates :unit, presence: true 
	
	self.per_page = 10

end
