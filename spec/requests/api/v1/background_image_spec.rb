require 'rails_helper'

describe 'Consume API: Unsplash' do
  it "renders serialized JSON object" do
    location = 'Denver,CO'
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:data][:attributes]).to have_key(:image_urls)
    expect((parsed_response[:data][:attributes]).count).to eq(2)
  end
end
