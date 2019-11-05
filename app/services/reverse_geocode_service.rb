class ReverseGeocodeService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def response
    JSON.parse(connection.body, symbolize_names: true)[:results][0][:formatted_address]
  end

  private

  def connection
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
                  faraday.params[:key] = ENV['google_api_key']
                  faraday.params[:latlng] = "#{@latitude},#{@longitude}"
                end
  end
end
