class DarkSkyService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def response
      JSON.parse(connection.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.get("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@latitude},#{@longitude}")
  end
end
