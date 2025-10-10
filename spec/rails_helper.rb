# spec/rails_helper.rb
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("dummy/config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
require "capybara/rspec"
require "view_component/test_helpers"
require 'ammeter/init'

Dir[File.join(__dir__, "support/**/*.rb")].sort.each { |f| require f }

Rails.application.routes.default_url_options[:host] = "example.test"

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.define_derived_metadata(file_path: %r{\Aspec/components/}) { |m| m[:type] = :component }
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers,    type: :component
end
