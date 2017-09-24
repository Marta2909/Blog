require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get prays" do
    get news_prays_url
    assert_response :success
  end

  test "should get events" do
    get news_events_url
    assert_response :success
  end

  test "should get shelf" do
    get news_shelf_url
    assert_response :success
  end

  test "should get ministries" do
    get news_ministries_url
    assert_response :success
  end

  test "should get testimonies" do
    get news_testimonies_url
    assert_response :success
  end

end
