class AmypodeFacade
  attr_reader :amypode_response, :antipode_parsed_forecast, :antipode_city

  def initialize(latitude, longitude)
    @amypode_response = response(latitude, longitude)
  end

  def antipode_parsed_forecast
    lat = @amypode_response[:lat]
    long = @amypode_response[:long]
    antipode_forecast = ForecastFacade.new(lat, long).forecast_response
    antipode_forecast[:currently]
  end

  def response(latitude, longitude)
    response = AmypodeService.new(latitude, longitude).connection
    parse_response(response)[:data][:attributes]
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
