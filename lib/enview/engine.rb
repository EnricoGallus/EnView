module Enview
  class Engine < ::Rails::Engine
    isolate_namespace Enview

    config.app_generators do |g|
      g.template_engine :enview
    end

    initializer "enview.view_components" do |app|
      app.config.autoload_paths   << root.join("app", "components")
      app.config.eager_load_paths << root.join("app", "components")
    end
  end
end
