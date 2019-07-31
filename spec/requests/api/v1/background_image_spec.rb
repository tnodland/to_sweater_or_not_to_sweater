require 'rails_helper'

RSpec.describe "background image spec" do
  it "can use flikr to send a background image" do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data][:attributes]).to have_key(:weather)
  end
end
