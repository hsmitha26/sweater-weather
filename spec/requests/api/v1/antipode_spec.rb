require 'rails_helper'

describe 'Consume APIs: Amypode, Google Geocode and Dark Sky' do
  it "renders serialized JSON object" do
    location = 'Hong Kong'
    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:data][:attributes]).to have_key(:search_location)
    expect((parsed_response[:data][:attributes]).count).to eq(3)
  end
end
