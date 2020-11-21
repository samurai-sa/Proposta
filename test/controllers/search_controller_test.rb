require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get search_form_url
    assert_response :success
  end

end
