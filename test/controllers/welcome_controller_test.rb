require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  fixtures :users

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end


  test "should post  the login and follow through the users page" do
    post "/login", params: { email: users(:loic).email,
                             hashpw: users(:loic).hashpw }
    assert_equal 200, status
    assert_equal "/login", path
    end



end
