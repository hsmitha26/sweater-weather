class Api::V1::TripsController < ApplicationController
  before_action :set_user

  def create
    if set_user
      trip = Trip.new(trip_params)
      trip.user_id = set_user.id
      if trip.save
        TripFacade.new(trip).fetch_forecast_for_travel_time
        # origin = trip.origin
        # destination = trip.destination
        # #make call to geocode api to get lat/lng for destination
        # latitude = GeocodeService.new(destination).latitude
        # longitude = GeocodeService.new(destination).longitude
        # #make call to directions api to get travel time
        # connection = Faraday.get('https://maps.googleapis.com/maps/api/directions/json?') do |faraday|
        #               faraday.params[:key] = ENV['google_directions_api_key']
        #               faraday.params[:origin] = origin
        #               faraday.params[:destination] = destination
        #             end
        # parsed_response = JSON.parse(connection.body, symbolize_names: true)
        # #convert seconds to hours and round up
        # duration_in_seconds = parsed_response[:routes][0][:legs][0][:duration][:value]
        # duration_in_hours = ((duration_in_seconds.to_f)/3600).ceil
        # #make call to dark sky api to get hourly forecast for travel duration
        # forecast = DarkSkyService.new(latitude, longitude).response
        # #get hourly forecast for number of hours.
        # forecast_for_trip = forecast[:hourly][:data].first(duration_in_hours)
        binding.pry
      else
        render :not_found
      end
    else
      render :unauthorized
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end

  def user_params
    params.permit(:api_key)
  end

  def set_user
    User.find_by(uuid: user_params[:api_key])
  end
end
