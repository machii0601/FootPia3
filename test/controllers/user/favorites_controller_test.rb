require "test_helper"

class User::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_favorites_show_url
    assert_response :success
  end
end
