require 'rails_helper'

RSpec.describe DarkskyService, :vcr do
  it "can get weather data given 2 coordiantes" do
    service = DarkskyService.new
    response = service.weather(37.8267, -122.4233)
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body).to have_key(:timezone)
    expect(body).to have_key(:currently)
    expect(body[:minutely]).to be_a(Hash)
    expect(body[:minutely][:data].count).to eq(61)
    expect(body[:hourly][:data].count).to eq(49)
    expect(body[:daily][:data].count).to eq(8)
  end
end
