require 'rails_helper'

describe 'Create User object' do
  it "generates a random API key" do
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post "/api/v1/users", :params => params
    expect(response).to be_successful
  end
end
