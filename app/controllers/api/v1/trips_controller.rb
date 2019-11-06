class Api::V1::TripsController < ApplicationController
  before_action :set_user

  def create
    #check api_key is missing first and then proceed
    if set_user
      trip = Trip.new(trip_params)
      # trip.user_id = user.id
      binding.pry
    end
  end

  private

  def set_user
    User.find_by(uuid: user_params[:api_key])
  end

  def trip_params
    params.permit(:origin, :destination)
  end

  def user_params
    params.permit(:api_key)
  end
end
