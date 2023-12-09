require_relative '../lib/scraper'

class ImagesWorker
  include Sidekiq::Worker

  def perform(*_args)
    images = Scraper.new.init_scrape
    $redis.set('images', images.to_json)
    $redis.expire('images', 30.seconds.to_i)
  end
end
