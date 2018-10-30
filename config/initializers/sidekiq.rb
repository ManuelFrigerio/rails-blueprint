opts = { url: ENV['REDISCLOUD_URL'], namespace: 'myapp-sidekiq' }

Sidekiq.configure_client do |config|
  config.redis = opts

  config.client_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end

Sidekiq.configure_server do |config|
  config.redis = opts

  config.server_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end

  config.client_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end

Sidekiq::Extensions.enable_delay!

def redis_client
  Sidekiq.redis { |conn| conn }
end
Redis::Objects.redis = redis_client