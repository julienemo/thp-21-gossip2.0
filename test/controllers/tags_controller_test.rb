require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get each" do
    get tags_each_url
    assert_response :success
  end

end
