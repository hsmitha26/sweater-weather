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
  end
end
