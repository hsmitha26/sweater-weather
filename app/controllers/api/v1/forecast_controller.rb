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
  end
end
