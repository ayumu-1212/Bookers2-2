require 'test_helper'

class SnowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get snow_index_url
    assert_response :success
  end

end
