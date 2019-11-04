class DarkSkyService
  attr_reader :connection

  def initialize(latitude, longitude)
    @connection = Faraday.get("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{latitude},#{longitude}")
  end
end
