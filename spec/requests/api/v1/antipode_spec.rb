require 'rails_helper'

describe 'Consume APIs: ' do
  it "Amypode, Google Geocode and Dark Sky" do
    location = 'Hong Kong'
    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    expect(parsed_response[:data][:attributes]).to have_key(:)
  end
end
