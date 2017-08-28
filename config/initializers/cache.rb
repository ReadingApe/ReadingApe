Rails.application.configure do
  if ENV["REDIS_URL"].present?
    config.cache_store = :redis_store, ENV['REDIS_URL'], { expires_in: 90.minutes }
  end
end
