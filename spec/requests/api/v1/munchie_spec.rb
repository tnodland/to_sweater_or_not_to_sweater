require 'rails_helper'

RSpec.describe "munchie request", :vcr do
  it "can send 3 resturaunts that will be open at a desired location" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
  end
end
