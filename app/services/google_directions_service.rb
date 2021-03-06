class GoogleDirectionsService < BaseService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    parse_response[:routes][0][:legs][0][:duration][:value]
  end

  private

  def connection
    Faraday.get('https://maps.googleapis.com/maps/api/directions/json?') do |faraday|
                  faraday.params[:key] = ENV['google_directions_api_key']
                  faraday.params[:origin] = @origin
                  faraday.params[:destination] = @destination
                end
  end
end
