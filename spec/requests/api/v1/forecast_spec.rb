require 'rails_helper'

describe 'Consume APIs: Google Geocode and Dark Sky' do
  it "renders serialized JSON object" do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:data][:attributes]).to have_key(:current_weather)
    expect((parsed_response[:data][:attributes]).count).to eq(4)
  end
end
