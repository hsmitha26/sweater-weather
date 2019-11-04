class ForecastFacade
  attr_reader :parsed_forecast_response
  def initialize(latitude, longitude)
    @parsed_forecast_response = response(latitude, longitude)
  end

  def response(latitude, longitude)
    # response = ForecastService.new(latitude, longitude)
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{latitude},#{longitude}")
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
