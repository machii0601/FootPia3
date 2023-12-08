require "test_helper"

class User::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_follows_index_url
    assert_response :success
  end

  test "should get followers" do
    get user_follows_followers_url
    assert_response :success
  end

  test "should get following" do
    get user_follows_following_url
    assert_response :success
  end
end
