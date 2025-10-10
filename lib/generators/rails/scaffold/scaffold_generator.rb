# This generator overrides the default `rails g scaffold` in host apps
# to use Enview's templates and behavior, without forcing a global
# template_engine setting.

require_relative "../../enview/scaffold/scaffold_generator"

module Rails
  module Generators
    class ScaffoldGenerator < ::Enview::Generators::ScaffoldGenerator
      # Inherit everything from Enview::Generators::ScaffoldGenerator
      # so running `rails g scaffold` in a host app will use Enview.
    end
  end
end
