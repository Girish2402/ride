class Bill < ActiveRecord::Base
	belongs_to :user
	belongs_to :offerride
end
