require 'rails_helper'

RSpec.describe "munchie request" do
  it "can send 3 resturaunts that will be open at a desired location" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data][0]).to be_a(Hash)
    expect(parsed_response[:data][0]).to have_key(:id)
  end
end
