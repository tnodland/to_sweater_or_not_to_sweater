require 'rails_helper'

RSpec.describe 'getting forecasts', :vcr do
  it "can send forecast data" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:current_weather)
    expect(json[:data][:attributes]).to have_key(:daily_weather)
    expect(json[:data][:attributes]).to have_key(:hourly_weather)
    expect(json[:data][:attributes][:daily_weather][:data]).to be_a(Array)
    expect(json[:data][:attributes][:daily_weather][:data].count).to eq(8)
    expect(json[:data][:attributes][:hourly_weather][:data]).to be_a(Array)
    expect(json[:data][:attributes][:hourly_weather][:data].count).to eq(49)
  end
end
