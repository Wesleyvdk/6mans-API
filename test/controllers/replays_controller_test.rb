require "test_helper"

class ReplaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get replays_create_url
    assert_response :success
  end
end
