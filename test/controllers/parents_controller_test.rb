require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get parents_url, as: :json
    assert_response :success
  end

  test "should create parent" do
    assert_difference("Parent.count") do
      post parents_url, params: { parent: { address: @parent.address } }, as: :json
    end

    assert_response :created
  end

  test "should show parent" do
    get parent_url(@parent), as: :json
    assert_response :success
  end

  test "should update parent" do
    patch parent_url(@parent), params: { parent: { address: @parent.address } }, as: :json
    assert_response :success
  end

  test "should destroy parent" do
    assert_difference("Parent.count", -1) do
      delete parent_url(@parent), as: :json
    end

    assert_response :no_content
  end
end
