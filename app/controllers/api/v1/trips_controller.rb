class Api::V1::TripsController < ApplicationController
  before_action :set_user

  def create
    if set_user
      trip = Trip.new(trip_params)
      trip.user_id = set_user.id
      if trip.save
        x = TripFacade.new(trip).fetch_forecast_for_travel_time
        #create serializer and pass data_prep
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
