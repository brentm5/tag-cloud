TagCloud::Application.configure do
  config.cache_classes = true
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"
  config.whiny_nils = true
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.cache_store = :null_store
  config.session_store :cookie_store, key: '_mclimans_session'
  config.secret_token = '16fedc6045f410c10ec8d86a5ab31df37e5c64ac49540b98f0bb55a68b7ecb4c0039d22f096d06ac09dca1006811d41a7526a2c7800aacc39346b4f14955ae6e'
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_record.mass_assignment_sanitizer = :strict
  config.active_support.deprecation = :stderr
end
