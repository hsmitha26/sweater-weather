class ForecastFacade
  attr_reader :forecast_response, :location
  def initialize(location)
    @location = location
    @forecast_response = response(latitude, longitude)
  end

  def response(latitude, longitude)
    response = DarkSkyService.new(latitude, longitude).connection
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def latitude(location)
    LocationFacade.new(location).latitude
  end

  def longitude(location)
    LocationFacade.new(location).longitude
  end
end
