class AdminMailer < ApplicationMailer
  default from: 'no-reply@br8ghter.com'

  def confirm_email(user)
    @event = Event.find_by(admin_id: user.id)
    @user = user
    @url  = "http://localhost:3000/events/#{user.id}"
    mail(to: @user.email, subject: 'Welcome to br8ghter!')
  end
end
