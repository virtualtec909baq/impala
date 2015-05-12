class OfferUser < ActiveRecord::Base
	validates :price, presence: true 
	validates :quantity, presence: true 
	belongs_to :offer
	belongs_to :user
	
	after_initialize :init 

	def init
		self.status  ||= true		
	end
end
