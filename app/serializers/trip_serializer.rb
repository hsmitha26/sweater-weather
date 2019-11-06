class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :hourly_weather, :travel_time
end
