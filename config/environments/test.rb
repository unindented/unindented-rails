Rails.application.configure do
  config.cache_classes = true
  config.eager_load    = false

  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=#{1.hour.to_i}"

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_controller.allow_forgery_protection = false

  config.action_controller.default_url_options = { trailing_slash: true }

  config.active_support.deprecation = :stderr

  config.action_dispatch.show_exceptions = false
end
