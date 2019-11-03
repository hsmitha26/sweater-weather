require 'rails_helper'

describe 'api consumption' do
  it "google geocode and dark sky" do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"
    # binding.pry
    expect(response).to be_successful
  end
end
