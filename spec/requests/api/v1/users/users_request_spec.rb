require "rails_helper"

RSpec.describe "Get All Users" do
  describe "Creating and confirming users" do
    it 'gets all users' do
      user1 = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com")
      user2 = User.create!(first_name: "Tom", last_name: "Jones", email: "tom@jones.com")
      user3 = User.create!(first_name: "Jason", last_name: "Smith", email: "jason@smith.com")
  
      get "/api/v1/users"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(3)
      expect(json[:data][0][:attributes]).to have_key(:first_name)
      expect(json[:data][0][:attributes]).to have_key(:last_name)
      expect(json[:data][0][:attributes]).to have_key(:email)
    end
  end
end