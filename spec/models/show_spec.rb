require "rails_helper"

RSpec.describe Show, type: :model do
  describe "Relationships" do
    it {should have_many (:schedules)}
    it {should have_many(:users).through(:schedules)}
  end

  describe "Validations" do
    let!(:show) {create(:show)}

    it { should validate_presence_of(:artist) }
    it { should validate_uniqueness_of(:artist) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
  end
end