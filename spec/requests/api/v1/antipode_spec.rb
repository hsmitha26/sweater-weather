require 'rails_helper'

describe 'api consume' do
  it "amypode" do
    location = 'Hong Kong'
    get "/api/v1/antipode?location=#{location}"
    expect(response).to be_successful
  end
end
