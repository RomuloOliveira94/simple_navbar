require "test_helper"
require "generators/simple_navbar/install_generator"

class SimpleNavbar::GeneratorTest < Rails::Generators::TestCase
  tests SimpleNavbar::InstallGenerator
  destination File.expand_path("../tmp", __dir__)
  setup :prepare_destination

  def test_copies_stylesheet
    run_generator
    assert_file "app/assets/stylesheets/simple_navbar.css"
  end

  def test_copies_javascript_with_stimulus_with_app_javascript
    run_generator [ "--stimulus" ]
    assert_file "app/javascript/controllers/simple_navbar_controller.js"
  end

  def test_copies_javascript_without_stimulus_with_app_javascript
    run_generator
    assert_file "app/javascript/custom/simple_navbar.js"
  end

  def test_copies_to_assets_if_legacy_option_is_passed
    run_generator [ "--legacy" ]
    assert_file "app/assets/javascripts/simple_navbar.js"
  end

  def test_includes_helper_in_application_controller
    mkdir_p "tmp/app/controllers"
    File.write("tmp/app/controllers/application_controller.rb", "class ApplicationController < ActionController::Base\nend")
    run_generator
    assert_file "app/controllers/application_controller.rb" do |content|
      assert_match(/helper SimpleNavbar/, content)
    end
  end
end
