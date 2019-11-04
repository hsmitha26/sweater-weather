class LocationFacade
  attr_reader :location, :latitude, :longitude
  def initialize(location)
    @latitude = response(location)[:lat]
    @longitude = response(location)[:lng]
  end

  def response(location)
    response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:address] = location
                end
    parse_response(response)
  end

  private
  
  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
