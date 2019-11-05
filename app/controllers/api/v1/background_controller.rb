class Api::V1::BackgroundController < ApplicationController
  def show
    data_prep = BackgroundImageFacade.new(params[:location]).unsplash_data
binding.pry
    render json: BackgroundImageSerializer.new(data_prep)

    #make a PORO for data prep
    # pass PORO to serializer and render json
# binding.pry
  end
end
