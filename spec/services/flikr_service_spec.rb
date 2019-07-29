require 'rails_helper'

RSpec.describe FlikrService do
  it "returns an image from lat and long" do
    service = FlikrService.new

    response = service.image({:lat=>37.8267, :lng=>-122.4233})

    image = JSON.parse(response.body, symbolize_names: true)
    expect(image[:photos][:photo][0][:url_l]).to be_a(String)
  end
end
