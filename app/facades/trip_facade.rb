class TripFacade
  def initialize(trip)
    @destination = trip.destination
    @origin = trip.origin
    @latitude = fetch_latitude
    @longitude = fetch_longitude
    @travel_time = fetch_travel_time
  end

  def fetch_forecast_for_travel_time
    forecast = DarkSkyService.new(@latitude, @longitude).response
    forecast[:hourly][:data].first(@travel_time)
  end

  private

  def fetch_latitude
    @_google_geocode_latitude ||= GeocodeService.new(@destination).latitude
  end

  def fetch_longitude
    @_google_geocode_longitude ||= GeocodeService.new(@destination).longitude
  end

  def fetch_travel_time
    GoogleDirectionsService.new(@origin, @destination).travel_time
    # connection = Faraday.get('https://maps.googleapis.com/maps/api/directions/json?') do |faraday|
    #               faraday.params[:key] = ENV['google_directions_api_key']
    #               faraday.params[:origin] = @origin
    #               faraday.params[:destination] = @destination
    #             end
    # parsed_response = JSON.parse(connection.body, symbolize_names: true)
    # duration_in_seconds = parsed_response[:routes][0][:legs][0][:duration][:value]
    # duration_in_hours = ((duration_in_seconds.to_f)/3600).ceil
  end
end
