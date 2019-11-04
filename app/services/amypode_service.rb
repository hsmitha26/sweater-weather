class AmypodeService
  attr_reader :connection

  def initialize(latitude, longitude)
    @connection = Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes?') do |faraday|
                  faraday.headers[:api_key] = ENV['amypode_api_key']
                  faraday.params[:lat] = latitude
                  faraday.params[:long] = longitude
                end
  end
end
