class Api::V1::ForecastController < ApplicationController
  def show
    city = 'Denver'
    state = 'CO'
    address = "#{city},#{state}"
    coordinates = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
      faraday.params[:key] = ENV['google_api_key']
      faraday.params[:address] = address
    end
    parsed_coordinates = JSON.parse(coordinates.body, symbolize_names: true)[:results][0][:geometry][:location]
    latitude = parsed_coordinates[:lat]
    longitude = parsed_coordinates[:lng]
    key = ENV['dark_sky_api_key']
    forecast = Faraday.get("https://api.darksky.net/forecast/#{key}/#{latitude},#{longitude}")
    parsed_forecast = JSON.parse(forecast.body, symbolize_names: true)
    current_weather_data = parsed_forecast[:currently]
    hourly_weather_data = parsed_forecast[:hourly][:data]
    daily_weather_data = parsed_forecast[:daily][:data]
  end
end
