class UserMailer < ActionMailer::Base
  default from: "info@overflowapp.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://morning-river-4764.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to Overflow!")
  end
end
