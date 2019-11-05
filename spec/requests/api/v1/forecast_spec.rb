require 'rails_helper'

describe 'Consume APIs' do
  it "Google Geocode and Dark Sky" do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"
    expect(response).to be_successful
  end
end
