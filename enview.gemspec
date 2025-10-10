require_relative "lib/enview/version"

Gem::Specification.new do |spec|
  spec.name        = "enview"
  spec.version     = Enview::VERSION
  spec.authors     = [ "enrico" ]
  spec.email       = [ "enrico.gallus@gmail.com" ]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of Enview."
  spec.description = "TODO: Description of Enview."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_runtime_dependency "rails", ">= 8.0.3"
  spec.add_runtime_dependency "view_component", "~> 4.0"
  spec.add_runtime_dependency "tailwindcss-rails", "~> 4.3"
  spec.add_runtime_dependency "pundit", "~> 2.5"

  spec.add_development_dependency "rspec-rails", "~> 8.0"
  spec.add_development_dependency "capybara", "~> 3.40"
  spec.add_development_dependency "ammeter", "~> 1.1"
end
