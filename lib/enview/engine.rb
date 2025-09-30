module Enview
  class Engine < ::Rails::Engine
    isolate_namespace Enview

    config.app_generators do |g|
      g.template_engine :enview
    end
  end
end
