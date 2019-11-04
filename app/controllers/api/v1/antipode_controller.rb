class Api::V1::AntipodeController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    parse_amypode_response = AmypodeFacade.new(latitude, longitude).amypode_response

    antipode_latitude = parse_amypode_response[:lat]
    antipode_longitude = parse_amypode_response[:long]

#refactor: move to AmypodeFacade
    antipode_parsed_forecast = ForecastFacade.new(antipode_latitude, antipode_longitude).forecast_response
    current_antipode_forecast = antipode_parsed_forecast[:currently]

#refactor: move to AmypodeFacade
    reverse_geocode_data = ReverseGeocodeService.new(antipode_latitude, antipode_longitude).parsed_response

x = AntipodeForecast.new(params[:location], antipode_parsed_forecast, reverse_geocode_data)
y =
render json: AntipodeSerializer.new(x)
binding.pry

    #serialized JSON
    #need the following:
    #forecast pointing to
    #antipode_parsed_forecast[:currently][:summary]
    #antipode_parsed_forecast[:currently][:temperature]
    #city from reverse_geocode_connection
    #params[:location]
  end
end
