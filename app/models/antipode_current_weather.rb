class AntipodeCurrentWeather
  def initialize(forecast_data)
    @summary = forecast_data[:summary]
    @temperature = forecast_data[:temperature]
  end
end
