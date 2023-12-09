require_relative '../../app/lib/scraper'

namespace :repeat do
  desc 'Repeat fetching of images'
  task fetch_images: :environment do
    images = $redis.get('images')
    if images.nil?
      images = Scraper.new.init_scrape
      $redis.set('images', images.to_json)
      $redis.expire('images', 30.seconds.to_i)
    end
  end
end
