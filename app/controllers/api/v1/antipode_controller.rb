class Api::V1::AntipodeController < ApplicationController
  def show
    antipode_forecast = AmypodeFacade.new(params[:location]).antipode_parsed_forecast

    antipode_city = AmypodeFacade.new(params[:location]).antipode_city

    data_prep = AntipodeForecast.new(params[:location], antipode_forecast, antipode_city)

    render json: AntipodeSerializer.new(data_prep)
  end
end
