require 'test_helper'

class SearchSuppliersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_suppliers_index_url
    assert_response :success
  end

end
