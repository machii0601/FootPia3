require "test_helper"

class User::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_post_comments_new_url
    assert_response :success
  end

  test "should get index" do
    get user_post_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get user_post_comments_show_url
    assert_response :success
  end
end
