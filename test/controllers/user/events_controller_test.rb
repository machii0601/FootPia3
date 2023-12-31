require "test_helper"

class User::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_events_index_url
    assert_response :success
  end

  test "should get events" do
    get user_events_events_url
    assert_response :success
  end

  test "should get show" do
    get user_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_events_edit_url
    assert_response :success
  end
end
