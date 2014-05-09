require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

# memcached 配置信息
MEMCACHED_CONFIG = YAML.load_file('./config/memcached.yml')[Rails.env].symbolize_keys

module PudDown
  class Application < Rails::Application
    config.time_zone = 'Beijing'

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    
    config.i18n.default_locale = 'zh-CN'
    
    config.cache_store = :dalli_store, MEMCACHED_CONFIG[:host], { 
      namespace: MEMCACHED_CONFIG[:namespace],
      pool_size: MEMCACHED_CONFIG[:pool_size],
      compress: MEMCACHED_CONFIG[:compress]
    }
    
    # grape config
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
