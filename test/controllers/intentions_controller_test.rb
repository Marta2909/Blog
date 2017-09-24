require 'test_helper'

class IntentionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get intentions_new_url
    assert_response :success
  end

  test "should get create" do
    get intentions_create_url
    assert_response :success
  end

end
