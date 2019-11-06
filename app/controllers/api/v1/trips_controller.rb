class Api::V1::TripsController < ApplicationController
  before_action :set_user

  def create
      trip = Trip.new(trip_params)
      (trip.user_id = set_user.id) if set_user
      if trip.save
        forecast_data = TripFacade.new(trip).data_prep
        render json: TripSerializer.new(forecast_data), status: :ok
      else
        trip_not_found
      end
  end

  private

  def trip_not_found
    render status: :not_found
  end

  def trip_params
    params.permit(:origin, :destination)
  end

  def user_params
    params.permit(:api_key)
  end

  def set_user
    user = User.find_by(uuid: user_params[:api_key])
    if user == nil
      render status: :unauthorized
    else
      user
    end
  end
end
