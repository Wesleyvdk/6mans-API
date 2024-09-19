require "test_helper"

class ScrimsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scrims_index_url
    assert_response :success
  end

  test "should get show" do
    get scrims_show_url
    assert_response :success
  end

  test "should get create" do
    get scrims_create_url
    assert_response :success
  end

  test "should get join" do
    get scrims_join_url
    assert_response :success
  end
end
