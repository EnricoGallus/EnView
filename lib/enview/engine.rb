module Enview
  class Engine < ::Rails::Engine
    isolate_namespace Enview

    config.app_generators do |g|
      g.template_engine :enview
    end

    app.config.autoload_paths   << root.join("app", "components")
    app.config.eager_load_paths << root.join("app", "components")
  end
end
