class ForecastFacade
  attr_reader :parsed_forecast_response
  def initialize(latitude, longitude)
    @parsed_forecast_response = response(latitude, longitude)
  end

  def response(latitude, longitude)
    response = DarkSkyService.new(latitude, longitude).forecast_response
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
