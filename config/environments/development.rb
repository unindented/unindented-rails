Rails.application.configure do
  config.cache_classes = false
  config.eager_load    = false

  config.assets.debug = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_controller.default_url_options = { trailing_slash: true }

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load
end
