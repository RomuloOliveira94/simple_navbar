require "application_simple_test_case"


class SimpleNavbar::IntegrationTest < ApplicationSystemTestCase
  test "it renders a simple navbar with dropdown" do
    visit root_path

    assert_selector "nav.simple-nav-bar"
    assert_selector "div.simple-nav-bar-container"
    assert_selector "a.simple-nav-bar-brand-link"
    assert_selector "h1.simple-nav-bar-brand-title"
    assert_selector "img.simple-nav-bar-brand-logo"
    assert_selector "button.simple-nav-bar-burger-button"
    assert_selector "button.simple-nav-bar-close-button"
    assert_selector "div.simple-nav-bar-nav-list-container"
    assert_selector "nav"
    assert_selector "ul.simple-nav-bar-nav-list"
    assert_selector "li.simple-nav-bar-nav-item.simple-nav-bar-nav-item-dropdown"
  end
end
