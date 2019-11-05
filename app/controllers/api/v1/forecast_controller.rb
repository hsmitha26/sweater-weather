class Api::V1::ForecastController < ApplicationController
  def show
    parsed_forecast = ForecastFacade.new(params[:location]).response
    render json: ForecastSerializer.new(Forecast.new(parsed_forecast))
  end
end
