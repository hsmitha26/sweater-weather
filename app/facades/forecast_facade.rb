class ForecastFacade
  def initialize(location)
    @location = location
    @latitude = geocode_latitude
    @longitude = geocode_longitude
  end

  def response
    @_dark_sky_forecast_data ||= DarkSkyService.new(@latitude, @longitude).response
  end

  private

  def geocode_latitude
    @_google_geocode_latitude ||= GeocodeService.new(@location).latitude
  end

  def geocode_longitude
    @_google_geocode_longitude ||= GeocodeService.new(@location).longitude
  end
end
