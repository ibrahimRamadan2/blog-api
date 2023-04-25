require "test_helper"

class AtricleControllerTest < ActionDispatch::IntegrationTest
  test "should get comment" do
    get atricle_comment_url
    assert_response :success
  end

  test "should get user" do
    get atricle_user_url
    assert_response :success
  end

  test "should get category" do
    get atricle_category_url
    assert_response :success
  end

  test "should get nested_comment" do
    get atricle_nested_comment_url
    assert_response :success
  end
end
