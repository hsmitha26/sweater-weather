class HourlyWeather
  attr_reader :time, :summary, :temperature, :icon
  def initialize(hourly_data)
    @time = current_time(hourly_data[:time])
    @summary = hourly_data[:summary]
    @temperature = hourly_data[:temperature]
    @icon = hourly_data[:icon]
  end

  def current_time(unix_time)
    Time.at(unix_time).strftime("%I:%M %p")
  end

  def tonight
    if @time == "10:00 PM"
      @summary
    end
  end
end
