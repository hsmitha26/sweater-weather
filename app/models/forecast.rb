class Forecast
  attr_reader :id

  def initialize(parsed_forecast)
    @id = "0"
    @forecast_data = parsed_forecast
  end

  def current_weather
    @current_weather ||= CurrentWeather.new(@forecast_data)
  end

  def daily_weather
    @forecast_data[:daily][:data][0..7].map do |day|
      DailyWeather.new(day)
    end
  end

  def hourly_weather
    @forecast_data[:hourly][:data][0..11].map do |hour|
      HourlyWeather.new(hour)
     end
  end
end
