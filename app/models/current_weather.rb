class CurrentWeather
  attr_reader :time, :summary, :icon, :temperature, :humidity, :feels_like, :visibility, :UV_index, :high, :low

  def initialize(forecast_data)
    @time = forecast_data[:currently][:time]
    @summary =  forecast_data[:currently][:summary],
    @icon =  forecast_data[:currently][:icon],
    @temperature =  forecast_data[:currently][:temperature],
    @humidity =  forecast_data[:currently][:humidity],
    @feels_like =  forecast_data[:currently][:apparentTemperature],
    @visibility =  forecast_data[:currently][:visibility],
    @UV_index =  forecast_data[:currently][:uvIndex],
    @high = forecast_data[:daily][:data].first[:temperatureHigh],
    @low = forecast_data[:daily][:data].first[:temperatureLow]
  end
end
