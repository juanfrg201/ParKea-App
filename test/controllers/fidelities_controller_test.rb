require "test_helper"

class FidelitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fidelities_index_url
    assert_response :success
  end

  test "should get create" do
    get fidelities_create_url
    assert_response :success
  end

  test "should get enable" do
    get fidelities_enable_url
    assert_response :success
  end

  test "should get disable" do
    get fidelities_disable_url
    assert_response :success
  end
end
