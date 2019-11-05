class ForecastFacade
  attr_reader :response

  def initialize(location)
    @location = location
    @latitude = geocode_latitude
    @longitude = geocode_longitude
  end

  def response
    DarkSkyService.new(@latitude, @longitude).response
  end

  private
  
  def geocode_latitude
    GeocodeService.new(@location).latitude
  end

  def geocode_longitude
    GeocodeService.new(@location).longitude
  end
end
