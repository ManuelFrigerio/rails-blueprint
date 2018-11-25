class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user

    send_email(user.email, "Welcome to #{ENV['APP_NAME']}!")
  end

end
