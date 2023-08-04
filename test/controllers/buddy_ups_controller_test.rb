require "test_helper"

class BuddyUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buddy_ups_index_url
    assert_response :success
  end
end
