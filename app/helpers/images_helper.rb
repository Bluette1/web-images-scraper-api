require_relative '../lib/scraper'

module ImagesHelper
  def images
    images = $redis.get('images')

    if images.nil?
      images = Scraper.new.init_scrape
      $redis.set('images', images.to_json)
      $redis.expire('images', 1.day.to_i)
    else
      images = JSON.parse images
    end

    images
  end
end
