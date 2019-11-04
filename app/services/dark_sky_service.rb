class DarkSkyService
  attr_reader :forecast_response
  
  def initialize(latitude, longitude)
    @forecast_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{latitude},#{longitude}")
  end
end
