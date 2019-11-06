class DarkSkyService < BaseService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  private

  def connection
    Faraday.get("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@latitude},#{@longitude}")
  end
end
