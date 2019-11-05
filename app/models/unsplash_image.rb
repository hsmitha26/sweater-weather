class UnsplashImage
  attr_reader :id, :image_urls

  def initialize(image_urls)
    @id = "0"
    @image_urls = image_urls
  end
end
