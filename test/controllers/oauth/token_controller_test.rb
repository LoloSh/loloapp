require 'test_helper'

class TokenControllerTest < ActionDispatch::IntegrationTest


  test "should post oauth without parameters" do
    post oauth_token_url
    assert_response :bad_request
  end





end
