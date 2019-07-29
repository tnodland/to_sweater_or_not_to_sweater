require 'rails_helper'

RSpec.describe GoogleService, :vcr do
  it "can return lat and long from a location" do
    service = GoogleService.new

    response = service.coordiantes_from_location("denver,co")
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body[:results][0][:geometry][:location]).to have_key(:lat)
    expect(body[:results][0][:geometry][:location]).to have_key(:lng)
  end
end
