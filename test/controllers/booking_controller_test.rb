require "test_helper"

class BookingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booking_index_url
    assert_response :success
  end

  test "should get create" do
    get booking_create_url
    assert_response :success
  end

  test "should get destroy" do
    get booking_destroy_url
    assert_response :success
  end

  test "should get enable" do
    get booking_enable_url
    assert_response :success
  end

  test "should get disable" do
    get booking_disable_url
    assert_response :success
  end

  test "should get new" do
    get booking_new_url
    assert_response :success
  end
end
