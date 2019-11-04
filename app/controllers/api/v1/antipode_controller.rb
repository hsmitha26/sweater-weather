class Api::V1::AntipodeController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    amypode_connection = Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes?') do |faraday|
                  faraday.headers[:api_key] = ENV['amypode_api_key']
                  faraday.params[:lat] = latitude
                  faraday.params[:long] = longitude
                end
    parse_amypode_response = JSON.parse(amypode_connection.body, symbolize_names: true)[:data][:attributes]
    antipode_latitude = parse_amypode_response[:lat]
    antipode_longitude = parse_amypode_response[:long]

    antipode_parsed_forecast = ForecastFacade.new(antipode_latitude, antipode_longitude).forecast_response
    current_antipode_forecast = antipode_parsed_forecast[:currently]
    #antipode_parsed_forecast[:currently][:summary]
    #antipode_parsed_forecast[:currently][:temperature]

    #reverse geocode lookup
    reverse_geocode_connection = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:latlng] = "#{antipode_latitude},#{antipode_longitude}"
                end
    parse_reverse_geocode_response = JSON.parse(reverse_geocode_connection.body, symbolize_names: true)[:results][0][:formatted_address]

    binding.pry
  end
end
