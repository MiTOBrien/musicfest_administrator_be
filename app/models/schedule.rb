class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :title, presence: true
  validates :date, presence: true
end