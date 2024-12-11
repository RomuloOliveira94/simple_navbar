require "rails/generators"

module SimpleNavbar
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../", __dir__)

    class_option :stimulus, type: :boolean, default: false, desc: "Include Stimulus controller"

    def copy_stylesheet
      copy_file "app/assets/stylesheets/simple_navbar.css", "app/assets/stylesheets/simple_navbar.css"
    end

    def copy_javascript
      if using_webpacker_or_importmap?
        copy_to_javascript_folder
      else
        copy_to_assets_folder
      end
    end

    private

    def using_webpacker_or_importmap?
      Rails.root.join("app", "javascript").exist?
    end

    def copy_to_javascript_folder
      if options[:stimulus]
        copy_file "app/assets/javascript/simple_navbar_controller.js", "app/javascript/controllers/simple_navbar_controller.js"
      else
        copy_file "assets/javascript/simple_navbar.js", "app/javascript/custom/simple_navbar.js"
      end
    end

    def copy_to_assets_folder
      copy_file "app/assets/javascript/simple_navbar.js", "app/assets/javascripts/simple_navbar.js"
    end
  end
end
