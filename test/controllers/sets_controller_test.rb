require 'test_helper'

class SetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @set = sets(:one)
  end

  test "should get index" do
    get sets_url
    assert_response :success
  end

  test "should get new" do
    get new_set_url
    assert_response :success
  end

  test "should create set" do
    assert_difference('Set.count') do
      post sets_url, params: { set: {  } }
    end

    assert_redirected_to set_url(Set.last)
  end

  test "should show set" do
    get set_url(@set)
    assert_response :success
  end

  test "should get edit" do
    get edit_set_url(@set)
    assert_response :success
  end

  test "should update set" do
    patch set_url(@set), params: { set: {  } }
    assert_redirected_to set_url(@set)
  end

  test "should destroy set" do
    assert_difference('Set.count', -1) do
      delete set_url(@set)
    end

    assert_redirected_to sets_url
  end
end
