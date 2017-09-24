class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :category,  :validate => true
  attribute :body,      :validate => true
  attributes :nickname, :captcha => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Nowa wiadomość: " + category,
      :to => "szufitoja@yahoo.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
