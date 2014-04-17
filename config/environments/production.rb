Rails.application.configure do
  config.cache_classes = true
  config.eager_load    = true

  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=#{1.year.to_i}"

  config.assets.js_compressor  = :uglifier
  config.assets.css_compressor = :sass

  config.assets.compile = true
  config.assets.digest  = true
  config.assets.version = '1.0'

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.action_controller.default_url_options = { trailing_slash: true }

  config.active_support.deprecation = :notify

  config.i18n.fallbacks = true

  config.log_level     = :info
  config.log_formatter = ::Logger::Formatter.new
end
