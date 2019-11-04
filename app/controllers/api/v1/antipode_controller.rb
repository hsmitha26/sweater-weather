class Api::V1::AntipodeController < ApplicationController
  def show
    binding.pry
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude
  end
end
