require 'test_helper'

class ArtworksControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artworks_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get artworks_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get artworks_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get artworks_controller_destroy_url
    assert_response :success
  end

  test "should get create" do
    get artworks_controller_create_url
    assert_response :success
  end

end
