Resque.redis = ENV['REDIS_SERVER'] || 'localhost:6379'
Resque.redis.namespace = "resque:#{Rails.env}"