require 'rails_helper'

RSpec.describe "User based api requests" do
  it "can create a user" do
    post '/api/v1/users', params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json = JSON.parse(response.body, symbolize_names: true)
    api_key = json[:data][:attributes][:api_key]
    user = User.last

    expect(user.email).to eq("whatever@example.com")
    expect(user.api_key).to eq(api_key)
  end

  it "can find log in a user" do
    user = User.create(email: "example@mail.com", password: "password", api_key: "key")

    post '/api/v1/sessions', params: {
      "email": "example@mail.com",
      "password": "password"}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).to have_key(:api_key)
  end
end
