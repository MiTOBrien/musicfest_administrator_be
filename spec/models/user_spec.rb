require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it {should have_many (:schedules)}
    it {should have_many(:shows).through(:schedules)}
  end

  describe "Validations" do
    let!(:user) {create(:user)}

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end