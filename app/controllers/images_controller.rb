class ImagesController < ApplicationController
  include ImagesHelper
  def index
    @images = images
    render json: images
  end
end
