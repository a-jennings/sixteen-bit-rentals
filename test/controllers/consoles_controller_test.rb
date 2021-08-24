require 'test_helper'

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consoles_index_url
    assert_response :success
  end

  test "should get show" do
    get consoles_show_url
    assert_response :success
  end

  test "should get new" do
    get consoles_new_url
    assert_response :success
  end

  test "should get create" do
    get consoles_create_url
    assert_response :success
  end

  test "should get edit" do
    get consoles_edit_url
    assert_response :success
  end

  test "should get update" do
    get consoles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get consoles_destroy_url
    assert_response :success
  end

end
