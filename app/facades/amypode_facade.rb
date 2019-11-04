class AmypodeFacade
  attr_reader :amypode_response

  def initialize(latitude, longitude)
    @amypode_response = response(latitude, longitude)
  end

  def response(latitude, longitude)
    response = AmypodeService.new(latitude, longitude).connection
    parse_response(response)[:data][:attributes]
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
