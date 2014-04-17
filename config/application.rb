require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'sprockets/railtie'

Bundler.require(:default, Rails.env)

module Website
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
