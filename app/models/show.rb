class Show < ApplicationRecord
  has_many :schedules
  has_many :users, through: :schedules
  
  validates :artist, presence: true, uniqueness: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
end