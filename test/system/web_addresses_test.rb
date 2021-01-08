require "application_system_test_case"

class WebAddressesTest < ApplicationSystemTestCase
  setup do
    @web_address = web_addresses(:one)
  end

  test "visiting the index" do
    visit web_addresses_url
    assert_selector "h1", text: "Web Addresses"
  end

  test "creating a Web address" do
    visit web_addresses_url
    click_on "New Web Address"

    fill_in "Full address", with: @web_address.full_address
    fill_in "Short address", with: @web_address.short_address
    fill_in "Title", with: @web_address.title
    click_on "Create Web address"

    assert_text "Web address was successfully created"
    click_on "Back"
  end

  test "updating a Web address" do
    visit web_addresses_url
    click_on "Edit", match: :first

    fill_in "Full address", with: @web_address.full_address
    fill_in "Short address", with: @web_address.short_address
    fill_in "Title", with: @web_address.title
    click_on "Update Web address"

    assert_text "Web address was successfully updated"
    click_on "Back"
  end

  test "destroying a Web address" do
    visit web_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Web address was successfully destroyed"
  end
end
