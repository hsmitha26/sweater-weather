require 'rails_helper'

describe 'Create a Session' do
  it "returns user's API key after authentication" do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: 'password', uuid: "abcdefgh12345")
    params = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post "/api/v1/sessions", :params => params
    expect(response).to be_successful

    binding.pry

    # parsed_response = JSON.parse(response.body, symbolize_names: true)
    # expect(parsed_response).to have_key(:api_key)
    # expect(response).to have_http_status(201)
  end
end
