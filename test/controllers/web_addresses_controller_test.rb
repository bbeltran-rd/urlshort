require 'test_helper'

class WebAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_address = web_addresses(:one)
  end

  test "should get index" do
    get web_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_web_address_url
    assert_response :success
  end

  test "should create web_address" do
    assert_difference('WebAddress.count') do
      post web_addresses_url, params: { web_address: { full_address: @web_address.full_address, short_address: @web_address.short_address, title: @web_address.title } }
    end

    assert_redirected_to web_address_url(WebAddress.last)
  end

  test "should show web_address" do
    get web_address_url(@web_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_web_address_url(@web_address)
    assert_response :success
  end

  test "should update web_address" do
    patch web_address_url(@web_address), params: { web_address: { full_address: @web_address.full_address, short_address: @web_address.short_address, title: @web_address.title } }
    assert_redirected_to web_address_url(@web_address)
  end

  test "should destroy web_address" do
    assert_difference('WebAddress.count', -1) do
      delete web_address_url(@web_address)
    end

    assert_redirected_to web_addresses_url
  end
end
