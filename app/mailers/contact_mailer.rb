class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject
  #


  def contact(message)
    @body = message.body
    @category = message.category
    @email = message.email

    mail to: "mglubowska@gmail.com", from: @email, subject: "Nowa wiadomość: " + @category
  end
end
