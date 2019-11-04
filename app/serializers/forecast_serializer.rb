class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather_hash, :daily_weather_hash, :hourly_weather_hash
end
