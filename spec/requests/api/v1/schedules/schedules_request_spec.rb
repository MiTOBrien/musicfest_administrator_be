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

    let(:invalid_attributes) do
      {
        title: nil,  # Invalid: missing title
        date: Date.today + 30,
        user_id: user.id,
        show_id: show.id
      }
    end

    it 'fails to create a schedule with invalid attributes' do
      post "/api/v1/schedules", params: invalid_attributes
  
      expect(response).to have_http_status(:unprocessable_entity)  # Expect 422 status
      json = JSON.parse(response.body)
  
      # Check for validation errors
      expect(json['errors']).to include("Title can't be blank")
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

  describe "Get Schedules" do
    let!(:user) { create(:user) }
    let!(:show) { create(:show) }
  
    let(:valid_attributes) do
      {
        title: Faker::Music::RockBand.song,
        date: Date.today + 30,
        user_id: user.id,
        show_id: show.id
      }
    end
  
    it 'Gets schedules' do
      post "/api/v1/schedules", params: valid_attributes

      expect(response).to have_http_status(:created)
      
      created_schedule = Schedule.last
      expect(created_schedule).not_to be_nil
      expect(created_schedule.title).to eq(valid_attributes[:title])
      expect(created_schedule.date).to eq(valid_attributes[:date])
      expect(created_schedule.user_id).to eq(user.id)
      expect(created_schedule.show_id).to eq(show.id)
  
      get "/api/v1/schedules"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)

      expect(json.any? { |s| s['title'] == valid_attributes[:title] }).to be_truthy
      expect(json.any? { |s| s['date'] == valid_attributes[:date].to_s }).to be_truthy
    end
  end

  describe "DELETE /api/v1/schedules/:id" do
    let!(:user) { create(:user) }
    let!(:show) { create(:show) }
    let!(:schedule) { create(:schedule, user: user, show: show) }
  
    it 'deletes the schedule and returns a success message' do
      expect(Schedule.exists?(schedule.id)).to be_truthy
      
      delete "/api/v1/schedules/#{schedule.id}"
      
      expect(response).to have_http_status(:ok)
      
      json = JSON.parse(response.body)
      expect(json['message']).to eq("Schedule successfully deleted.")
      
      expect(Schedule.exists?(schedule.id)).to be_falsey
    end
  end

  describe "GET /api/v1/schedules/:id" do
    let!(:user) { create(:user) }
    let!(:show) { create(:show) }
    let!(:schedule) { create(:schedule, user: user, show: show) }
  
    it 'returns the schedule details for the given user' do
      get "/api/v1/schedules/#{user.id}"

      expect(response).to have_http_status(:ok)
    
      json = JSON.parse(response.body)
      
      expect(json['user_name']).to eq("#{user.first_name} #{user.last_name}")
      
      expect(json['schedules'].first['title']).to eq(schedule.title)
      expect(json['schedules'].first['date']).to eq(schedule.date.to_s)
    end
  end  
end