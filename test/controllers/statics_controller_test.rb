require "test_helper"

class TiendasControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get statics_contact_url
    assert_response :success
  end

  test "should get about" do
    get statics_about_url
    assert_response :success
  end
end
