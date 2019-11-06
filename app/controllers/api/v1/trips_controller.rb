class Api::V1::TripsController < ApplicationController
  before_action :set_user

  def create
    if set_user
      trip = Trip.new(trip_params)
      trip.user_id = set_user.id
      if trip.save
        #make call to geocode api to get lat/lng for destination
        location = trip.destination
        latitude = GeocodeService.new(location).latitude
        longitude = GeocodeService.new(location).longitude
        #make call to directions api to get travel time
        #make call to dark sky api to get hourly forecast for travel duration
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

  def set_user
    User.find_by(uuid: user_params[:api_key])
  end

  def user_params
    params.permit(:api_key)
  end
end
