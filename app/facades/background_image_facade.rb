class BackgroundImageFacade
  attr_reader :unsplash_data

  def initialize(location)
    @location = location
  end

  def unsplash_data
    data = parsed_response[:results][0][:urls]
    UnsplashImage.new(data)
  end

  private

  def parsed_response
    JSON.parse(connection.body, symbolize_names: true)
  end

  def connection
    UnsplashService.new(@location).connection
  end
end
