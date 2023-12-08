# frozen_string_literal: true

require_relative './scraper'

module ImagesHelper
  include Scraper
  def images
    images = $redis.get('images')

    if images.nil?
      images = init_scrape
      $redis.set('images', images.to_json)
      $redis.expire('images', 1.day.to_i)
    else
      images = JSON.parse images
    end

    @images = images
  end
end
