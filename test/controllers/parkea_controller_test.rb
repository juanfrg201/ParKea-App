require "test_helper"

class ParkeaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parkea_index_url
    assert_response :success
  end
end
