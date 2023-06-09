require "test_helper"

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get export_to_pdf" do
    get charts_export_to_pdf_url
    assert_response :success
  end
end
