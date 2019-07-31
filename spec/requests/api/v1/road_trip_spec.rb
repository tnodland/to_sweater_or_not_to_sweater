require "rails_helper"

RSpec.describe "road trip request" do
  it "can give the weather at the end of a road trip" do
    user = User.create(email: 'mail@example.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
    post '/api/v1/road_trip', params: {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }


    expect(response).to be_successful
  end
end
