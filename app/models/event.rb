class Event < ApplicationRecord
  # validates :start_date, presence: true
  # validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :attendances
  belongs_to :admin, class_name: 'User'
  has_many :attendees, through: :attendances, source: :user
end
