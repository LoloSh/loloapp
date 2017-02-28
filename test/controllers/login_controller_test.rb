require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest

  fixtures :users

  test "should be redirected if it is a get" do
    get login_url
    assert_response :success
  end

  test "should be linked to the home page if it is a post" do
    post login_url
    assert_response :success
  end




end