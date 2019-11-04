class Api::V1::ForecastController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    parsed_forecast = ForecastFacade.new(latitude, longitude).forecast_response

    current_weather_data = parsed_forecast[:currently]
    hourly_weather_data = parsed_forecast[:hourly][:data]
    daily_weather_data = parsed_forecast[:daily][:data]
  end
end
