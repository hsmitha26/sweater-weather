class GoogleDirectionsService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    parsed_response[:routes][0][:legs][0][:duration][:value]
    # ((parsed_response.to_f)/3600).ceil
  end

  private

  def parsed_response
    JSON.parse(connection.body, symbolize_names: true)
    # parsed_response[:routes][0][:legs][0][:duration][:value]
  end

  def connection
    Faraday.get('https://maps.googleapis.com/maps/api/directions/json?') do |faraday|
                  faraday.params[:key] = ENV['google_directions_api_key']
                  faraday.params[:origin] = @origin
                  faraday.params[:destination] = @destination
                end
  end
end
