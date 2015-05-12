class Offer < ActiveRecord::Base
	# Validations
	validates :service_start_date, presence: true 
	validates :service_finish_date, presence: true 
	validates :offer_start_date, presence: true 
	validates :offer_finish_date, presence: true
	# relationship
	has_many :users, :through => :offer_users
	has_many :offer_users, :dependent => :destroy 
	
	# default for will_paginate
  	self.per_page = 10
	
	# filterrific to apply => http://filterrific.clearcove.ca/pages/action_controller_api.html
	
	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		filter_names: [
			:search_query_product,
			:search_query_destination,
			:search_query_origins,
			:with_service_start_date_gte,
			:with_service_finish_date_lt
		]
	)
	
	scope :search_query_product, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("offers.product LIKE ?", "%#{query}%")
	}

	scope :search_query_destination, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("offers.destination LIKE ?", "%#{query}%")
	}
	
	scope :search_query_origins, lambda { |query|
		return nil  if query.blank? 
		query = query.to_s
		where("offers.origins LIKE ?", "%#{query}%")
	}

	scope :with_service_start_date_gte, lambda { |reference_time|
		return nil  if reference_time.blank? 
		where('offers.service_start_date >= ?', reference_time)
	}
	
	scope :with_service_finish_date_lt, lambda { |reference_time|
		return nil  if reference_time.blank? 
		where('offers.service_finish_date < ?', reference_time)
	}
	
end
