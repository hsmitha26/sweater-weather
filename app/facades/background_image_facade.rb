class BackgroundImageFacade
  attr_reader :unsplash_data

  def initialize(location)
    @location = location
  end

  def unsplash_data
    parsed_response[:results][0][:urls]
  end

  def parsed_response
    JSON.parse(connection.body, symbolize_names: true)
  end

  def connection
    UnsplashService.new(@location).connection
  end
end
