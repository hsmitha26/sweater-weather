class Api::V1::AntipodeController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    antipode_forecast = AmypodeFacade.new(latitude, longitude).antipode_parsed_forecast
binding.pry
#     antipode_latitude = parse_amypode_response[:lat]
#     antipode_longitude = parse_amypode_response[:long]
#
# #refactor: move to AmypodeFacade
#     antipode_parsed_forecast = ForecastFacade.new(antipode_latitude, antipode_longitude).forecast_response
#     current_antipode_forecast = antipode_parsed_forecast[:currently]

#refactor: move to AmypodeFacade
    reverse_geocode_data = ReverseGeocodeService.new(antipode_latitude, antipode_longitude).parsed_response

    data_prep = AntipodeForecast.new(params[:location], antipode_forecast, reverse_geocode_data)

    render json: AntipodeSerializer.new(data_prep)
  end
end
