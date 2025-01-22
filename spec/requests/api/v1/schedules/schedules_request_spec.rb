require "rails_helper"

RSpec.describe "Schedules" do
  describe "Creating Schedules" do
    let!(:user) {create(:user)}
    let!(:show) {create(:show)}
    let(:valid_attributes) do {
      title: Faker::Music::RockBand.song,
      date: Date.today + 30,
      user_id: user.id,
      show_id: show.id
    }
    end

    it 'create schedules' do
      post "/api/v1/schedules", params: valid_attributes

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)

      expect(json['title']).to eq(valid_attributes[:title])
      expect(json['date']).to eq(valid_attributes[:date].to_s) 
      expect(json['user_id']).to eq(user.id)
      expect(json['show_id']).to eq(show.id)
    end
  end

  describe 'Get Schedule For User' do
    let!(:user) {create(:user)}
    let!(:shows) {create_list(:show, 3)}

    before do
      shows.each do |show|
        schedule_params = {
          schedule: {
            title: Faker::Music::RockBand.song,
            date: Date.today + rand(1..3),
            user_id: user.id,
            show_id: show.id
          }
        }
        post "/api/v1/schedules", params: schedule_params
        expect(response).to have_http_status(:created)
        binding.pry
      end
    end

    it 'Returns the user and shows' do

      get "/api/v1/schedules/#{user.id}"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)

      expect(json.size).to eq(3)

    end
  end
end