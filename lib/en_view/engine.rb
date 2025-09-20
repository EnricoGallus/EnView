module EnView
  class Engine < ::Rails::Engine
    isolate_namespace EnView

    config.app_generators do |g|
      g.template_engine :en_view
    end
  end
end
