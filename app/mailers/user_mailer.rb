class UserMailer < ActionMailer::Base
  default from: "info@overflowapp.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://www.overflowmech.com"
    mail(:to => user.email, :subject => "Welcome to Overflow!")
  end
end
