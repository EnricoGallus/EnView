require "generators/tailwindcss/scaffold/scaffold_generator"

module Enview
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

      def ensure_pundit_installed
        app_policy = File.join(destination_root, "app/policies/application_policy.rb")
        return if File.exist?(app_policy)

        say_status :invoke, "pundit:install", :green
        Rails::Generators.invoke(
          "pundit:install",
          [],
          behavior: behavior,
          destination_root: destination_root
        )
      end

      def generate_pundit_policy
        say_status :invoke, "pundit:policy #{class_name}", :green
        Rails::Generators.invoke(
          "pundit:policy",
          [ class_name ],
          behavior: behavior,
          destination_root: destination_root
        )
      end
    end
  end
end
