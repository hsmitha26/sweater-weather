class Api::V1::BackgroundController < ApplicationController
  def show
    data_prep = BackgroundImageFacade.new(params[:location]).unsplash_data
    render json: BackgroundImageSerializer.new(data_prep)
  end
end
