class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable,:lockable

    mount_uploader :avatar, AvatarUploader

    has_many :offerrides
    has_many :bills

    acts_as_messageable

    # def name
    # 	"User #{id}"
    # end

    def mailboxer_email(object)
    	nil
    end
end
