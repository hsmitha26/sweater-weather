class CurrentWeather
  attr_reader :date, :summary, :icon, :temperature, :humidity, :feels_like, :visibility, :UV_index, :high, :low

  def initialize(forecast_data)
    @date = current_date(forecast_data[:currently][:time])
    @time = current_time(forecast_data[:currently][:time])
    @summary =  forecast_data[:currently][:summary]
    @icon =  forecast_data[:currently][:icon]
    @temperature =  forecast_data[:currently][:temperature]
    @humidity =  forecast_data[:currently][:humidity]
    @feels_like =  forecast_data[:currently][:apparentTemperature]
    @visibility =  forecast_data[:currently][:visibility]
    @UV_index =  forecast_data[:currently][:uvIndex]
    @high = forecast_data[:daily][:data].first[:temperatureHigh]
    @low = forecast_data[:daily][:data].first[:temperatureLow]
  end

  def current_date(unix_time)
    Time.at(unix_time).strftime("%m/%d/%y")
  end

  def current_time(unix_time)
    Time.at(unix_time).strftime("%I:%M %p")
  end
end
