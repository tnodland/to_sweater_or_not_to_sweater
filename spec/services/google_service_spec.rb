require 'rails_helper'

RSpec.describe GoogleService do
  it "can return lat and long from a location", :vcr do
    service = GoogleService.new

    response = service.coordiantes_from_location("denver,co")
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body[:results][0][:geometry][:location]).to have_key(:lat)
    expect(body[:results][0][:geometry][:location]).to have_key(:lng)
  end

  it "can return the time between 2 locations", :vcr do
    service = GoogleService.new

    response = service.time_between("Disneyland", "Universal Studios Hollywood")
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body[:routes]).to be_a(Array)
    expect(body[:routes][0][:legs][0][:duration]).to be_a(Hash)
    expect(body[:routes][0][:legs][0][:duration]).to have_key(:text)
    expect(body[:routes][0][:legs][0][:duration]).to have_key(:value)
  end
end
