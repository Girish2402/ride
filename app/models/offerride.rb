class Offerride < ActiveRecord::Base
	has_one :cardetail
	belongs_to :user
	has_many :bills
	
	scope :search, lambda{|arg,arg1,arg2|
	 	where(:from_point => arg , :to_point => arg1,:d_date=> arg2)
	 }

end
