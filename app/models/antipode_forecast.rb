class AntipodeForecast
  attr_reader :id, :location_name, :search_location, :forecast

  def initialize(location_name, forecast_data, search_location)
    @id = "101"
    @forecast_data = forecast_data[:currently]
    @location_name = location_name
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
