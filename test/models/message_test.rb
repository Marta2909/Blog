require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'responds to name, email and body' do
    msg = Message.new

    assert msg.respond_to?(:name), 'nie odpowiada na :name'
    assert msg.respond_to?(:email), 'nie odpowiada na :email'
    assert msg.respond_to?(:body), 'nie odpowiada na :body'
  end

  test 'should be valid when all attributes are set' do
    attrs = {
      name: 'stephen',
      email: 'stephen@example.org',
      body: 'costam'
    }

    msg = Message.new attrs
    assert msg.valid?, 'should be valid'
  end

  test 'name, email and body should not be blank' do
    msg = Message.new

    refute msg.valid?, 'Blank message should be invalid'
    assert_match /blank/, msg.errors[:name].to_s
    assert_match /blank/, msg.errors[:email].to_s
    assert_match /blank/, msg.errors[:body].to_s
  end
end
