class AdminMailer < ApplicationMailer

  def send_message(current_admin, recipient, subject, message)
    @current_admin = current_admin
    @recipient = recipient
    @subject = subject
    @message = message
    mail(to: @recipient, subject: @subject)
  end
end
