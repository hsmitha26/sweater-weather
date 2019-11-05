class AmypodeService
  attr_reader :response

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def response
    JSON.parse(connection.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes?') do |faraday|
                  faraday.headers[:api_key] = ENV['amypode_api_key']
                  faraday.params[:lat] = @latitude
                  faraday.params[:long] = @longitude
                end
  end
end
