class UserMailer < ActionMailer::Base
  default from: "overflowmech@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://www.overflowmech.com"
    mail(:to => user.email, :subject => "Welcome to OverflowMech!")
  end
end
