class UserMailer < ApplicationMailer
	default from: "from@example.com"
 
  def bill_generate(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'ride booking details')
  end
end
