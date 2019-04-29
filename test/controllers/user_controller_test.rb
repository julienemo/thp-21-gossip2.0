require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get user_detail_url
    assert_response :success
  end

end
