require 'test_helper'

class InstanceTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instance_time = instance_times(:one)
  end

  test "should get index" do
    get instance_times_url
    assert_response :success
  end

  test "should get new" do
    get new_instance_time_url
    assert_response :success
  end

  test "should create instance_time" do
    assert_difference('InstanceTime.count') do
      post instance_times_url, params: { instance_time: {  } }
    end

    assert_redirected_to instance_time_url(InstanceTime.last)
  end

  test "should show instance_time" do
    get instance_time_url(@instance_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_instance_time_url(@instance_time)
    assert_response :success
  end

  test "should update instance_time" do
    patch instance_time_url(@instance_time), params: { instance_time: {  } }
    assert_redirected_to instance_time_url(@instance_time)
  end

  test "should destroy instance_time" do
    assert_difference('InstanceTime.count', -1) do
      delete instance_time_url(@instance_time)
    end

    assert_redirected_to instance_times_url
  end
end
