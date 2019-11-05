class DailyWeather
  def initialize(daily_data)
      @day = daily_data[:time],
      @time = daily_data[:time],
      @summary = daily_data[:summary],
      @icon = daily_data[:icon],
      @precipitation = daily_data[:precipProbability],
      @high = daily_data[:temperatureHigh],
      @low = daily_data[:temperatureLow]
  end
end
