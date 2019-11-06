class Api::V1::TripsController < ApplicationController
  # before_create :user_authenticate

  def create
    user = User.find_by(uuid: user_params[:api_key])
    if user
      trip = Trip.new(trip_params)
      trip.user_id = user.id
      if trip.save
        forecast_data = TripFacade.new(trip).data_prep
        render json: TripSerializer.new(forecast_data)
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

  def user_authenticate
    User.find_by(uuid: user_params[:api_key])
  end
end
