require "rails_helper"

RSpec.describe "Destory A show" do
  describe "Destorying A Show" do
    it 'can destory a show' do
      show = Show.create!(artist: "Taylor Swift", location: "Stage 1", date: Date.new(2025, 1, 31), time: Time.parse("20:00"))
      
      delete "/api/v1/shows/#{show.id}"

      expect(response).to have_http_status(:no_content)
    end
  end
end