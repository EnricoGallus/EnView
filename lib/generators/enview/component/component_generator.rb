# frozen_string_literal: true

require "generators/view_component/component/component_generator"

module Enview
  module Generators
    class EnviewGenerator < ViewComponent::Generators::ErbGenerator
      source_root File.expand_path("templates", __dir__)
    end
  end
end
