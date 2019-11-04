class LocationFacade
  attr_reader :location, :latitude, :longitude
  def initialize(location)
    @latitude = response(location)[:lat]
    @longitude = response(location)[:lng]
  end

  def response(location)
    response = GeocodeService.new(location).connection
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
