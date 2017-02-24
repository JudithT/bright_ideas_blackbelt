require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get bright_ideas" do
    get users_bright_ideas_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
