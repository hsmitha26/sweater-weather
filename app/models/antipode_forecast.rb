class AntipodeForecast
  attr_reader :id, :location_name, :search_location

  def initialize(search_location, forecast_data, antipode_city)
    @id = "101"
    @forecast_data = forecast_data
    @location_name = antipode_city
    @search_location = search_location
    @forecast = forecast
  end

  def forecast
    {
      summary: @forecast_data[:summary],
      current_temperature: @forecast_data[:temperature]
    }
  end
end
