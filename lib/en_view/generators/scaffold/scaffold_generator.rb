require "generators/tailwindcss/scaffold/scaffold_generator"

module EnView
  module Generators
    class ScaffoldGenerator < Tailwindcss::Generators::ScaffoldGenerator
      source_root File.expand_path("templates", __dir__)

      # Override methods from Rails scaffold as needed
      # def create_controller_files
      #   say "Using Enview scaffold controller!"
      #   # Your custom controller generator logic
      # end
      #
      # def create_views
      #   say "Using Enview scaffold views with ViewComponents!"
      #   # You can render your component templates
      # end
    end
  end
end
