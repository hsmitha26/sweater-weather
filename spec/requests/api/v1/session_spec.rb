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

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response).to have_key(:api_key)
    expect(parsed_response[:api_key]).to eq(user.uuid)
    expect(response).to have_http_status(200)
  end

  it "renders 404" do
    params = {
      "email": "whatever@example.com",
    }
    post "/api/v1/users", :params => params

    expect(response).to have_http_status(404)
  end
end
