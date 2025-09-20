# lib/enview/generators/scaffold/scaffold_generator.rb
require "rails/generators/rails/scaffold/scaffold_generator"

module Enview
  module Generators
    class ScaffoldGenerator < Rails::Generators::ScaffoldGenerator
      source_root File.expand_path("templates", __dir__)

      # Override methods from Rails scaffold as needed
      def create_controller_files
        say "Using Enview scaffold controller!"
        # Your custom controller generator logic
        super
      end

      def create_views
        say "Using Enview scaffold views with ViewComponents!"
        # You can render your component templates
        super
      end
    end
  end
end
