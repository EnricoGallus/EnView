module Enview
  class Engine < ::Rails::Engine
    config.app_generators do |g|
      g.template_engine :enview
    end
  end
end
