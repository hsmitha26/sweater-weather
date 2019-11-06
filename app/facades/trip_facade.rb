class TripFacade
  def initialize(trip)
    @destination = trip.destination
    @origin = trip.origin
    @latitude = fetch_latitude
    @longitude = fetch_longitude
    @travel_time = fetch_travel_time
  end

  def fetch_forecast_for_travel_time
    fetch_forecast[:hourly][:data].first(@travel_time)
  end

  private

  def fetch_forecast
    @_forecast ||= DarkSkyService.new(@latitude, @longitude).response
  end

  def fetch_latitude
    @_google_geocode_latitude ||= GeocodeService.new(@destination).latitude
  end

  def fetch_longitude
    @_google_geocode_longitude ||= GeocodeService.new(@destination).longitude
  end

  def fetch_travel_time
    @_travel_time ||= GoogleDirectionsService.new(@origin, @destination).travel_time
  end
end
