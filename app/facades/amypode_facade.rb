class AmypodeFacade
  attr_reader :antipode_parsed_forecast, :antipode_city

  def initialize(search_city)
    @location = search_city
    @search_city_latitude = search_city_latitude
    @search_city_longitude = search_city_longitude
    @amypode_response = response
    @antipode_latitude = @amypode_response[:lat]
    @antipode_longitude = @amypode_response[:long]
  end

  def antipode_city
    ReverseGeocodeService.new(@antipode_latitude, @antipode_longitude).parsed_response
  end

  def antipode_parsed_forecast
    antipode_forecast = DarkSkyService.new(@antipode_latitude, @antipode_longitude).response
    antipode_forecast[:currently]
  end

  private

  def response
    response = AmypodeService.new(@search_city_latitude, @search_city_longitude).response
    response[:data][:attributes]
  end

  def search_city_latitude
    GeocodeService.new(@location).latitude
  end

  def search_city_longitude
    GeocodeService.new(@location).longitude
  end
end
