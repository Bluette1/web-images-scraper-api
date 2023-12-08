require 'redis-namespace'

$redis = Redis::Namespace.new('web_images_scraper_api', redis: Redis.new)
