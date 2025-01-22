# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  { first_name: "Mark", last_name: "Ballard", email: "mark_ballard@ballard.com" },
  { first_name: "Jen", last_name: "Ballard", email: "jen_ballard@ballard.com" },
  { first_name: "TJ", last_name: "Shiipley", email: "tj_shipley@shipley.com" },
  { first_name: "Nikki", last_name: "Shipley", email: "nikki_shipley@shipley.com" },
  { first_name: "Bill", last_name: "Peters", email: "bill_peters@peters.com" },
  { first_name: "Edith", last_name: "Peters", email: "edith_peters.com" }
].map do |user_data|
  User.create!(user_data)
end

shows = [
  { artist: "Taylor Swift", location: "Stage 1", date: Date.new(2025, 1, 31), time: Time.parse("20:00") },
  { artist: "Paul Rudd", location: "Stage 2", date: Date.new(2025, 1, 31), time: Time.parse("20:00") },
  { artist: "Dirty Blonde", location: "Stage 1", date: Date.new(2025, 2, 1), time: Time.parse("12:00") }, 
  { artist: "Twistur", location: "Stage 2", date: Date.new(2025, 2, 1), time: Time.parse("12:00") }, 
  { artist: "Death Lens", location: "Stage 1", date: Date.new(2025, 2, 1), time: Time.parse("16:00") }, 
  { artist: "Blondshell", location: "Stage 2", date: Date.new(2025, 2, 1), time: Time.parse("16:00") }, 
  { artist: "Carrie Underwood", location: "Stage 1", date: Date.new(2025, 2, 1), time: Time.parse("20:00") }, 
  { artist: "Parmalee", location: "Stage 2", date: Date.new(2025, 2, 1), time: Time.parse("20:00") }, 
  { artist: "Dan & Shay", location: "Stage 1", date: Date.new(2025, 2, 2), time: Time.parse("12:00") },
  { artist: "Drake", location: "Stage 2", date: Date.new(2025, 2, 2), time: Time.parse("12:00") }
].map do |show_data|
  Show.create!(show_data)
end

  schedules = [
    {title: "End of an Era", date: Date.new(2025, 1, 31), user_id: 1, show_id: 1},
    {title: "End of an Era", date: Date.new(2025, 1, 31), user_id: 2, show_id: 1},
    {title: "Litte Boo Show", date: Date.new(2025, 1, 31), user_id: 3, show_id: 2},
    {title: "Litte Boo Show", date: Date.new(2025, 1, 31), user_id: 4, show_id: 2},
    {title: "Carrie Live", date: Date.new(2025, 2, 1), user_id: 5, show_id: 7},
    {title: "Carrie Live", date: Date.new(2025, 2, 1), user_id: 6, show_id: 7},
    {title: "Dirty Blonde", date: Date.new(2025, 2, 1), user_id: 1, show_id: 3},
    {title: "Dirty Blonde", date: Date.new(2025, 2, 1), user_id: 2, show_id: 3},
    {title: "Twisted Rock", date: Date.new(2025, 2, 1), user_id: 3, show_id: 4},
    {title: "Twisted Rock", date: Date.new(2025, 2, 1), user_id: 4, show_id: 4},
    {title: "Just Off The Voice", date: Date.new(2025, 2, 2), user_id: 5, show_id: 9},
    {title: "Just Off The Voice", date: Date.new(2025, 2, 2), user_id: 6, show_id: 9}
].map do |schedule_data|
  Schedule.create!(schedule_data)
end