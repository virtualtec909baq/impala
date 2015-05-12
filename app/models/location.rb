class Location < ActiveRecord::Base
	validates :location, presence: true 
	validates :ref, presence: true 
	validates_uniqueness_of :ref
	validates_uniqueness_of :location

	self.per_page = 10

	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		filter_names: [
			:search_query_ref,
			:search_query_location
		]
	)

	scope :search_query_ref, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("locations.ref LIKE ?", "%#{query}%")
	}

	scope :search_query_location, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("locations.location LIKE ?", "%#{query}%")
	}
end
