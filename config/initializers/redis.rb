# 初始化redis配置文件
redis_config = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env].symbolize_keys
redis_namespace = redis_config[:namespace] || 'pudair'

# 初始化redis
redis = Redis.new host: redis_config[:host], port: redis_config[:port], password: redis_config[:password]

# 设置redis的database
redis.select(redis_config[:db] || 0)

# 设置redis的namespace
$redis_store = Redis::Namespace.new("#{redis_namespace}_store".to_sym, redis: redis)
$redis_cache = Redis::Namespace.new("#{redis_namespace}_cache".to_sym, redis: redis)
$redis_objects = Redis::Namespace.new("#{redis_namespace}_objects".to_sym, redis: redis)

# 设置Redis::Objects
Redis::Objects.redis = $redis_objects

