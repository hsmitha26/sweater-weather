class GeocodeService
  attr_reader :geocode_response
  def initialize(location)
    @geocode_response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:address] = location
                end
  end
end
