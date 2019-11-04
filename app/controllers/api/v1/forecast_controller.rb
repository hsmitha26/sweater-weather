class Api::V1::ForecastController < ApplicationController
  def show
    latitude = LocationFacade.new(params[:location]).latitude
    longitude = LocationFacade.new(params[:location]).longitude

    parsed_forecast = ForecastFacade.new(latitude, longitude).forecast_response

    render json: ForecastSerializer.new(Forecast.new(parsed_forecast))
  end
end

#need forecast PORO where data is formatted before passing to serializer. Need hashes for each section (current, hourly, daily)
#render json: needs an :id attribute.  Where to put it? Even though it's not needed for output?
#refactor to call LocationFacade inside ForecastFacade.  It should pass the #coordinates directly to ForecastFacade.
#refactor to use private methods in facades.
# refactor to use memoization in facades.
