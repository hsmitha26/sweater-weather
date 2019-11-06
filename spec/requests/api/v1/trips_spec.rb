require 'rails_helper'

describe 'User is authenticated using API key ' do
  it "renders JSON with forecast for travel time/destination" do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: 'password')
    user.update(uuid: "abcdefgh12345")
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "abcdefgh12345"
    }
    post "/api/v1/road_trips", :params => params
    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:data][:attributes]).to have_key(:travel_time)
    expect(parsed_response[:data][:attributes]).to have_key(:hourly_weather)
    expect(response).to have_http_status(200)
  end

  xit "renders 401 if user's api_key is not authenticated" do
    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: 'password')
    user.update(uuid: "doesn'tmatch")
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "abcdefgh12345"
    }
    post "/api/v1/road_trips", :params => params

    expect(response).to have_http_status(401)
  end

  xit "renders 404 if trip validations fail" do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: 'password')
    user.update(uuid: "abcdefgh12345")
    params = {
      "origin": "Denver,CO",
      "destination": "",
      "api_key": "abcdefgh12345"
    }
    post "/api/v1/road_trips", :params => params

    expect(response).to have_http_status(404)
  end
end
