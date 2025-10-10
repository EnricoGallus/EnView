# frozen_string_literal: true

require "generators/view_component/erb/erb_generator"

module ViewComponent
  module Generators
    # Template engine adapter so that `rails g view_component NAME` uses Enview templates
    # when `config.app_generators.template_engine = :enview` is set by the engine.
    class EnviewGenerator < ViewComponent::Generators::ErbGenerator
      source_root File.expand_path("templates", __dir__)
    end
  end
end
