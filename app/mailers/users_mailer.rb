class UsersMailer < ApplicationMailer

  def notify_user_on_signup(user)
    @user = user
    mail to: user.email, subject: "Account Created"
  end

  def notify_user_on_validation(user)
    @user = user
    mail to: user.email, subject: "Account Verified"
  end

  def contact_user(user, name, email, message)
    @user = user
    @email = email
    @contactee = name
    @message = message
    mail to: user.email, subject: "You've Been Messaged!"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

end
