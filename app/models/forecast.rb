class Forecast
  attr_reader :id, :forecast_data

  def initialize(parsed_forecast)
    @id = "0"
    @forecast_data = parsed_forecast
    @current_weather_hash = current_weather_hash
    @hourly_weather_hash = hourly_weather_hash
    @daily_weather_hash = daily_weather_hash
  end

  def current_weather_hash
    {
     time: forecast_data[:currently][:time],
     summary: forecast_data[:currently][:summary],
     icon: forecast_data[:currently][:icon],
     temperature: forecast_data[:currently][:temperature],
     humidity: forecast_data[:currently][:humidity],
     feels_like: forecast_data[:currently][:apparentTemperature],
     visibility: forecast_data[:currently][:visibility],
     UV_index: forecast_data[:currently][:uvIndex],
     high: forecast_data[:daily][:data].first[:temperatureHigh],
     low: forecast_data[:daily][:data].first[:temperatureLow]
    }
  end

  def hourly_weather_hash
    forecast_data[:daily][:data][0..7].map do |day|
      { day: day[:time],
        time: day[:time],
        summary: day[:summary],
        icon: day[:icon],
        precipitation: day[:precipProbability],
        high: day[:temperatureHigh],
        low: day[:temperatureLow]
      }
    end
  end

  def daily_weather_hash
    forecast_data[:hourly][:data][0..11].map do |hour|
       { time: hour[:time],
         summary: hour[:summary],
         temperature: hour[:temperature],
         icon: hour[:icon]
       }
     end
  end
end
