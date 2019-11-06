class TravelForecast
  attr_reader :id

  def initialize(travel_time, travel_forecast)
    @id = "1"
    @forecast = travel_forecast
    @travel_time = travel_time
  end

  def hourly_weather
    @forecast.first(@travel_time.to_i).map do |hour|
      HourlyWeather.new(hour)
    end
  end
end
