module Enview
  class Engine < ::Rails::Engine
    # Keep engine lean: do not force a global template_engine.
    # This allows host apps to use their own generators (e.g. view_component)
    # and only override what we explicitly provide.
  end
end
