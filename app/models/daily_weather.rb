class DailyWeather
  attr_reader :date, :summary, :icon, :precipitation, :high, :low

  def initialize(daily_data)
      @date = current_day(daily_data[:time])
      @summary = daily_data[:summary]
      @icon = daily_data[:icon]
      @precipitation = daily_data[:precipProbability]
      @high = daily_data[:temperatureHigh]
      @low = daily_data[:temperatureLow]
  end

  def current_day(unix_time)
    Time.at(unix_time).strftime("%m/%d/%y")
  end
end
