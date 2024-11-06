require "test_helper"

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get blog_home_url
    assert_response :success
  end
end
