require "simple_navbar/version"
require "simple_navbar/railtie"

module SimpleNavbar
  def simple_navbar(brand: {}, links: [])
    content_tag :nav, class: "simple-nav-bar" do
      content_tag(:div, class: "simple-nav-bar-container") do
        concat(
          content_tag(:a, href: brand[:url], class: "simple-nav-bar-brand-link") do
            concat content_tag(:h1, brand[:title], class: "simple-nav-bar-brand-title") if brand[:title].present?
            concat image_tag(brand[:logo], class: "simple-nav-bar-brand-logo") if brand[:logo].present?
          end
        )

        concat(
          content_tag(:button, class: "simple-nav-bar-burger-button") do
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
          end
        )

        concat(
          content_tag(:button, class: "simple-nav-bar-close-button") do
            concat content_tag(:span, "", class: "simple-nav-bar-close-line")
            concat content_tag(:span, "", class: "simple-nav-bar-close-line")
          end
        )

        concat(
          content_tag(:div, class: "simple-nav-bar-nav-list-container") do
            content_tag(:nav) do
              content_tag(:ul, class: "simple-nav-bar-nav-list") do
                links.map do |link|
                  if link[:dropdown]
                    concat(
                      content_tag(:li, class: "simple-nav-bar-nav-item simple-nav-bar-nav-item-dropdown") do
                        concat(
                          content_tag(:button, class: "simple-nav-bar-nav-link simple-nav-bar-dropdown-toggle") do
                            concat link[:dropdown][:label]
                            concat content_tag(:span, "▼", class: "simple-nav-bar-dropdown-arrow-down")
                            concat content_tag(:span, "▲", class: "simple-nav-bar-dropdown-arrow-up simple-nav-bar-hidden")
                          end
                        )
                        concat(
                          content_tag(:ul, class: "simple-nav-bar-dropdown-menu simple-nav-bar-hidden", data: { simple_navbar_target: "dropdownMenu" }) do
                            link[:dropdown][:links].map do |sublink|
                              concat content_tag(:li, link_to(sublink[:label], sublink[:url], class: "simple-nav-bar-dropdown-item"))
                            end.join.html_safe
                          end
                        )
                      end
                    )
                  else
                    concat content_tag(:li, link_to(link[:label], link[:url], class: "simple-nav-bar-nav-link"), class: "simple-nav-bar-nav-item")
                  end
                end.join.html_safe
              end
            end
          end
        )
      end
    end
  end

  def simple_navbar_s(brand: {}, links: [])
    content_tag :nav, class: "simple-nav-bar", data: { controller: "simple-navbar" } do
      content_tag(:div, class: "simple-nav-bar-container") do
        concat(
          content_tag(:a, href: brand[:url], class: "simple-nav-bar-brand-link") do
            concat content_tag(:h1, brand[:title], class: "simple-nav-bar-brand-title") if brand[:title].present?
            concat image_tag(brand[:logo], class: "simple-nav-bar-brand-logo") if brand[:logo].present?
          end
        )

        concat(
          content_tag(:button, class: "simple-nav-bar-burger-button", data: { action: "click->simple-navbar#menuToggle", simple_navbar_target: "burgerButton" }) do
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
          end
        )

        concat(
            content_tag(:button, class: "simple-nav-bar-close-button", data: { action: "click->simple-navbar#menuToggle", simple_navbar_target: "closeButton" }) do
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
            end
        )

        concat(
          content_tag(:div, class: "simple-nav-bar-nav-list-container", data: { simple_navbar_target: "menu" }) do
            content_tag(:nav) do
              content_tag(:ul, class: "simple-nav-bar-nav-list") do
                links.map do |link|
                  if link[:dropdown]
                    concat(
                      content_tag(:li, class: "simple-nav-bar-nav-item simple-nav-bar-nav-item-dropdown") do
                        concat(
                          content_tag(:button, class: "simple-nav-bar-nav-link", data: { simple_navbar_target: "dropdownToggle" }) do
                            concat link[:dropdown][:label]
                            concat content_tag(:span, "▼", class: "simple-nav-bar-dropdown-arrow-down")
                            concat content_tag(:span, "▲", class: "simple-nav-bar-dropdown-arrow-up simple-nav-bar-hidden")
                          end
                        )
                        concat(
                          content_tag(:ul, class: "simple-nav-bar-dropdown-menu simple-nav-bar-hidden", data: { simple_navbar_target: "dropdownMenu" }) do
                            link[:dropdown][:links].map do |sublink|
                              concat content_tag(:li, link_to(sublink[:label], sublink[:url], class: "simple-nav-bar-dropdown-item"))
                            end.join.html_safe
                          end
                        )
                      end
                    )
                  else
                    concat content_tag(:li, link_to(link[:label], link[:url], class: "simple-nav-bar-nav-link"), class: "simple-nav-bar-nav-item")
                  end
                end.join.html_safe
              end
            end
          end
        )
      end
    end
  end
end
