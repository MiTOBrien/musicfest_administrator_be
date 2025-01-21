class Show < ApplicationRecord
  validates :artist, presence: true, uniqueness: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
end