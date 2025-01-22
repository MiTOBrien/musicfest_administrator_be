FactoryBot.define do
  factory :schedule do
    association :user
    association :show
    date {Faker::Date.forward(days:30)}
    title { Faker::Music::RockBand.song}
  end
end