class NotificationMailer < ApplicationMailer

  def new_account(user)
    @user = user
    mail(to: user.email, subject: "Acount #{user.name} is active")
  end
end
