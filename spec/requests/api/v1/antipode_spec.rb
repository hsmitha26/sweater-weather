require 'rails_helper'

describe 'Consume APIs: ' do
  it "Amypode, Google Geocode and Dark Sky" do
    location = 'Hong Kong'
    get "/api/v1/antipode?location=#{location}"
    expect(response).to be_successful
  end
end
