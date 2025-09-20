module EnView
  class Engine < ::Rails::Engine
    isolate_namespace EnView

    config.generators do |g|
      g.test_framework :rspec, fixture: false, view_specs: false, helper_specs: false, routing_specs: false
      g.assets false
      g.helper false
      g.templates.unshift File.expand_path("lib/enview/generators/templates", root)
    end
  end
end
