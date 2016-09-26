class Cardetail < ActiveRecord::Base
	belongs_to :offerride
	mount_uploader :image, AvatarUploader
end
