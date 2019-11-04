class AmypodeFacade
  attr_reader :antipode_parsed_forecast, :antipode_city

  def initialize(latitude, longitude)
    @amypode_response = response(latitude, longitude)
    @latitude = @amypode_response[:lat]
    @longitude = @amypode_response[:long]
  end

  def antipode_city
    ReverseGeocodeService.new(@latitude, @longitude).parsed_response
  end

  def antipode_parsed_forecast
    antipode_forecast = ForecastFacade.new(@latitude, @longitude).forecast_response
    antipode_forecast[:currently]
  end

  def response(latitude, longitude)
    response = AmypodeService.new(latitude, longitude).connection
    parse_response(response)[:data][:attributes]
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
