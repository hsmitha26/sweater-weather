class Api::V1::ForecastController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude
  
    key = ENV['dark_sky_api_key']
    forecast = Faraday.get("https://api.darksky.net/forecast/#{key}/#{latitude},#{longitude}")
    parsed_forecast = JSON.parse(forecast.body, symbolize_names: true)
    current_weather_data = parsed_forecast[:currently]
    hourly_weather_data = parsed_forecast[:hourly][:data]
    daily_weather_data = parsed_forecast[:daily][:data]
  end
end
