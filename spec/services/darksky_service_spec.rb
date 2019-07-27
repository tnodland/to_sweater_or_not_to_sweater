require 'rails_helper'

RSpec.describe DarkskyService do
  it "can get weather data given 2 coordiantes" do
    service = DarkskyService.new
    response = service.weather(37.8267, -122.4233)
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body).to have_key(:timezone)
    expect(body).to have_key(:currently)
    expect(body[:minutely]).to be_a(Hash)
    expect(body[:minutely][:data].count).to eq(60)
    expect(body[:hourly][:data].count).to eq(48)
    expect(body[:daily][:data].count).to eq(7)
  end
end
