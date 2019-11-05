class UnsplashService
  def initialize(location)
    @location = location
  end

  def connection
    Faraday.get('https://api.unsplash.com/search/photos') do |faraday|
                  faraday.params[:client_id] = ENV['unsplash_client_id']
                  faraday.params[:query] = @location
                  faraday.params[:per_page] = 1
                end
  end
end
