require 'test_helper'

class ArtworkShareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artwork_share_index_url
    assert_response :success
  end

  test "should get create" do
    get artwork_share_create_url
    assert_response :success
  end

  test "should get update" do
    get artwork_share_update_url
    assert_response :success
  end

  test "should get destroy" do
    get artwork_share_destroy_url
    assert_response :success
  end

  test "should get show" do
    get artwork_share_show_url
    assert_response :success
  end

end
