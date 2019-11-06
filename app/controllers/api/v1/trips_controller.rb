class Api::V1::TripsController < ApplicationController
  def create
    trip = Trip.new(trip_params)
    binding.pry
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
