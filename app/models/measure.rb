class Measure < ActiveRecord::Base
	# Validations
	validates :unit, presence: true 
	
	self.per_page = 10

	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		filter_names: [
			:search_unit,
		]
	)

	scope :search_unit, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("measures.unit LIKE ?", "%#{query}%")
	}
end
