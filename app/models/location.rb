class Location < ActiveRecord::Base
	validates :location, presence: true 
	validates :ref, presence: true 
	validates_uniqueness_of :ref
	validates_uniqueness_of :location

	self.per_page = 10

end
