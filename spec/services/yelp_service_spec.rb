require 'rails_helper'

RSpec.describe YelpService, :vcr do
  it "can get resturaunts that will be open at a given time" do
    service = YelpService.new
    response = service.resturaunts_open_at("pueblo co", 1564414406, 3)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body[:businesses]).to be_a(Array)
    expect(body[:businesses].count).to eq(3)
    expect(body[:businesses][0]).to be_a(Hash)
    expect(body[:businesses][0]).to have_key(:name)
    expect(body[:businesses][0]).to have_key(:coordinates)
    expect(body[:businesses][0]).to have_key(:location)
  end
end
