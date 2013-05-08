TagCloud::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.cache_store = :dalli_store
  config.session_store ActionDispatch::Session::CacheStore, expire_after: 1800
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
end
