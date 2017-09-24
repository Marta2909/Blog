# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact
  def contact
    MessageMailer.contact Message.new(body: "hej to nowa wiadomość", email: "ja@example.com")
  end

end
