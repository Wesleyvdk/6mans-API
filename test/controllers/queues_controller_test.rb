require "test_helper"

class QueuesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get queues_create_url
    assert_response :success
  end

  test "should get destroy" do
    get queues_destroy_url
    assert_response :success
  end

  test "should get join" do
    get queues_join_url
    assert_response :success
  end

  test "should get leave" do
    get queues_leave_url
    assert_response :success
  end
end
