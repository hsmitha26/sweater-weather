class Api::V1::AntipodeController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    antipode_forecast = AmypodeFacade.new(latitude, longitude).antipode_parsed_forecast

    antipode_city = AmypodeFacade.new(latitude, longitude).antipode_city

    data_prep = AntipodeForecast.new(params[:location], antipode_forecast, antipode_city)

    render json: AntipodeSerializer.new(data_prep)
  end
end
