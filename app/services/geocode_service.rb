class GeocodeService
  attr_reader :connection
  def initialize(location)
    @connection = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:address] = location
                end
  end
end
