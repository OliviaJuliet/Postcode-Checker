require "application_system_test_case"

class ServedPostcodesTest < ApplicationSystemTestCase
  test "viewing the search page" do
    visit root_path
    assert_selector "h1", text: "Postcode Checker"
    assert_selector "input"
  end

  test "search for postcode" do
    visit root_path

    fill_in "query", with: "SE1 7QD"
    click_on "commit"

    assert_text "SE17QD"
    assert_text "within"
  end
end
