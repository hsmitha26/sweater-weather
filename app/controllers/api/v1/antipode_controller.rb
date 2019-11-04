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

    antipode_parsed_forecast = ForecastFacade.new(latitude, longitude).forecast_response
    binding.pry
  end
end
