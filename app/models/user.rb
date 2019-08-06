class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A(^@\s)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  after_save :send_welcome_email
  
  private

   def send_welcome_email
    NotificationMailer.new_account(self).deliver_later
   end
end
