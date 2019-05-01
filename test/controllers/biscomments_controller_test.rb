require 'test_helper'

class BiscommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get biscomments_new_url
    assert_response :success
  end

  test "should get create" do
    get biscomments_create_url
    assert_response :success
  end

  test "should get index" do
    get biscomments_index_url
    assert_response :success
  end

  test "should get show" do
    get biscomments_show_url
    assert_response :success
  end

  test "should get destroy" do
    get biscomments_destroy_url
    assert_response :success
  end

  test "should get update" do
    get biscomments_update_url
    assert_response :success
  end

end
