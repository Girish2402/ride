class Offerride < ActiveRecord::Base
	has_one :cardetail
	belongs_to :user
end
