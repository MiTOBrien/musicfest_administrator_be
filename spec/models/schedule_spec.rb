require "rails_helper"

RSpec.describe Schedule, type: :model do
  describe "Relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:show) }
  end
end
