class ReverseGeocodeService
  attr_reader :reverse_geocode_connection, :parsed_response

  def initialize(latitude, longitude)
    @reverse_geocode_connection = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:latlng] = "#{latitude},#{longitude}"
                end
    @parsed_response = JSON.parse(reverse_geocode_connection.body, symbolize_names: true)[:results][0][:formatted_address]
  end
end
