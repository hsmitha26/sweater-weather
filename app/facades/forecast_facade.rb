class ForecastFacade
  attr_reader :response

  def initialize(location)
    @location = location
    @latitude = geocode_latitude
    @longitude = geocode_longitude
  end

  def geocode_latitude
    LocationFacade.new(@location).latitude
  end

  def geocode_longitude
    LocationFacade.new(@location).longitude
  end

  def response
    response = DarkSkyService.new(@latitude, @longitude).connection
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
