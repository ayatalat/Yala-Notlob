require 'test_helper'

class GroupMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_members_index_url
    assert_response :success
  end

  test "should get add" do
    get group_members_add_url
    assert_response :success
  end

  test "should get remove" do
    get group_members_remove_url
    assert_response :success
  end

  test "should get show" do
    get group_members_show_url
    assert_response :success
  end

end
