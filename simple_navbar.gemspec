require_relative "lib/simple_navbar/version"

Gem::Specification.new do |spec|
  spec.name        = "simple_navbar"
  spec.version     = SimpleNavbar::VERSION
  spec.authors     = [ "Rômulo Oliveira" ]
  spec.email       = [ "romuloffall@gmail.com" ]
  spec.homepage    = "https://github.com/RomuloOliveira94/simple_navbar"
  spec.summary     = "Simple and easy navbar for Rails applications."
  spec.description = "Stop losing time creating a navbar from scratch. Use this gem to create a simple and easy navbar for your Rails applications."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/RomuloOliveira94/simple_navbar"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6", "< 9"
end
