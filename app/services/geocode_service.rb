class GeocodeService < BaseService
  attr_reader :latitude, :longitude

  def initialize(location)
    @location = location
    @latitude = response[:lat]
    @longitude = response[:lng]
  end

  def response
    parse_response[:results][0][:geometry][:location]
  end

  private

  def connection
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:address] = @location
                end
  end
end
