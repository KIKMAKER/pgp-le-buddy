require "test_helper"

class AppFeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_feedbacks_index_url
    assert_response :success
  end

  test "should get new" do
    get app_feedbacks_new_url
    assert_response :success
  end

  test "should get create" do
    get app_feedbacks_create_url
    assert_response :success
  end

  test "should get edit" do
    get app_feedbacks_edit_url
    assert_response :success
  end

  test "should get update" do
    get app_feedbacks_update_url
    assert_response :success
  end
end
