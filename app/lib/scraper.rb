require 'selenium-webdriver'

class Scraper
  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    options.add_argument('--remote-debugging-port=9222')
    options.add_argument('--disable-dev-shm-usage')
    create_driver options
  end

  def create_driver(options)
    @driver = Selenium::WebDriver.for(:chrome, options:)
    @driver.get 'https://picjumbo.com/free-stock-photos/nature/page/1'
    @pic_container = @driver.find_elements(tag_name: 'picture')

    @imgs = []
    @next_page_numbers = @driver.find_elements(css: 'a.page-numbers') # Store the links for the next 4 pages
    @next_pge_idx = 2
  end

  def add_pics(pic)
    img = pic.find_element(tag_name: 'img')
    src = img.attribute('src')
    alt = img.attribute('alt')
    @imgs << { src:, alt: }
  end

  def click_next(next_pge)
    next_pge.click
    @driver.find_elements(tag_name: 'picture')
  end

  def next_pge
    next_pge = @next_page_numbers[@next_pge_idx]
    @next_pge_idx += 1
    next_pge
  end

  def visit_page(pic_container)
    pic_container.each do |pic|
      add_pics pic
    end

    # Define a process to find the next button
    pic_container = click_next next_pge
    begin
      visit_page pic_container
    rescue StandardError
      @driver.quit
      @imgs
    end
  end

  def init_scrape
    visit_page @pic_container
  end
end
