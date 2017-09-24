require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "contact" do
    message = Message.new name: "ja", email: "ja@example.org", body: "hello"
    email = MessageMailer.contact(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal "Message from www.glodnachleba.pl", email.subject
    assert_equal ['marta@example.org'], email.to
    assert_equal ['ja@example.org'], email.from
    assert_match /hello/, email.body.encoded
  end

end
