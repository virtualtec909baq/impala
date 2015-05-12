class Product < ActiveRecord::Base
	# Validations
	validates :name, presence: true 
	validates :ref, presence: true 

	self.per_page = 10

	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		filter_names: [
			:search_query_ref,
			:search_query_detail
		]
	)

	scope :search_query_ref, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("products.ref LIKE ?", "%#{query}%")
	}

	scope :search_query_detail, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("products.name LIKE ?", "%#{query}%")
	}
	
end
