class AmypodeFacade
  attr_reader :antipode_parsed_forecast, :antipode_city

  def initialize(search_city)
    @search_city_latitude = search_city_latitude(search_city)
    @search_city_longitude = search_city_longitude(search_city)
    @amypode_response = response(@search_city_latitude, @search_city_longitude)
    @antipode_latitude = @amypode_response[:lat]
    @antipode_longitude = @amypode_response[:long]
  end

  def antipode_city
    ReverseGeocodeService.new(@antipode_latitude, @antipode_longitude).parsed_response
  end

  def antipode_parsed_forecast
    antipode_forecast = ForecastFacade.new(@antipode_latitude, @antipode_longitude).forecast_response
    antipode_forecast[:currently]
  end

  def response(latitude, longitude)
    response = AmypodeService.new(@search_city_latitude, @search_city_longitude).connection
    parse_response(response)[:data][:attributes]
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_city_latitude(search_city)
    LocationFacade.new(search_city).latitude
  end

  def search_city_longitude(search_city)
    LocationFacade.new(search_city).longitude
  end
end
