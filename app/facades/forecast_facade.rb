class ForecastFacade
  attr_reader :forecast_response
  def initialize(latitude, longitude)
    @forecast_response = response(latitude, longitude)
  end

  def response(latitude, longitude)
    response = DarkSkyService.new(latitude, longitude).forecast_response
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
