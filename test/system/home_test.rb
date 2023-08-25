require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_path

    assert_selector '[test-id="home-page-heading"]', text: "Pages#home"
  end
end
