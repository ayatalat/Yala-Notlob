require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get groups_all_url
    assert_response :success
  end

end
