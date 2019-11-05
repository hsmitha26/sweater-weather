class HourlyWeather
  def initialize(hourly_data)
    @time = hourly_data[:time],
    @summary = hourly_data[:summary],
    @temperature = hourly_data[:temperature],
    @icon = hourly_data[:icon]
  end
end
