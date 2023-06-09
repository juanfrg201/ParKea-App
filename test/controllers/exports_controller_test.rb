require "test_helper"

class ExportsControllerTest < ActionDispatch::IntegrationTest
  test "should get export_to_excel" do
    get exports_export_to_excel_url
    assert_response :success
  end
end
