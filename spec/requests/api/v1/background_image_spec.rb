require 'rails_helper'

describe 'Consume APIs: ' do
  it "Unsplash" do
    location = 'Denver,CO'
    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful
  end
end
