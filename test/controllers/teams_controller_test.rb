require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_index_url
    assert_response :success
  end

  test "should get show" do
    get teams_show_url
    assert_response :success
  end

  test "should get create" do
    get teams_create_url
    assert_response :success
  end

  test "should get update" do
    get teams_update_url
    assert_response :success
  end

  test "should get add_member" do
    get teams_add_member_url
    assert_response :success
  end

  test "should get remove_member" do
    get teams_remove_member_url
    assert_response :success
  end
end
