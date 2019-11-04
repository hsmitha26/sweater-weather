class Api::V1::BackgroundController < ApplicationController
  def show
    connection = Faraday.get('https://api.unsplash.com/search/photos') do |faraday|
                  faraday.params[:client_id] = ENV['unsplash_client_id']
                  faraday.params[:query] = params[:location]
                  faraday.params[:per_page] = 1
                end
    parsed_response = JSON.parse(connection.body, symbolize_names: true)
    parsed_unsplash_data = parsed_response[:results][0][:urls]
# binding.pry
  end
end
