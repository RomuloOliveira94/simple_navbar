require "rails/generators"

module SimpleNavbar
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../", __dir__)

    class_option :stimulus, type: :boolean, default: false, desc: "Copy Stimulus controller instead of plain JavaScript"
    class_option :legacy, type: :boolean, default: false, desc: "Copy to app/assets/javascripts instead of app/javascript"

    def copy_stylesheet
      copy_file "app/assets/stylesheets/simple_navbar.css", "app/assets/stylesheets/simple_navbar.css"
    end

    def copy_javascript
      if options[:legacy]
        copy_to_assets_folder
      else
        copy_to_javascript_folder
      end
    end

    def include_helper_in_application_controller
      inject_into_class "app/controllers/application_controller.rb", ApplicationController, "  helper SimpleNavbar\n"
    end

    def include_javascript_tag_in_layout
      unless options[:stimulus]
        inject_into_file "app/views/layouts/application.html.erb", before: "</head>\n" do
          "  <%= javascript_include_tag 'custom/simple_navbar' %>\n"
        end
      end
    end

    private

    def copy_to_javascript_folder
      if options[:stimulus]
        copy_file "app/assets/javascript/simple_navbar_controller.js", "app/javascript/controllers/simple_navbar_controller.js"
      else
        copy_file "app/assets/javascript/simple_navbar.js", "app/javascript/custom/simple_navbar.js"
      end
    end

    def copy_to_assets_folder
      copy_file "app/assets/javascript/simple_navbar.js", "app/assets/javascripts/simple_navbar.js"
    end
  end
end
