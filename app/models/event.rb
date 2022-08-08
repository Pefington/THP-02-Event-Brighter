class Event < ApplicationRecord
  after_create :confirm_send
  # validates :start_date, presence: true
  # validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :attendances
  belongs_to :admin, class_name: 'User'
  has_many :attendees, through: :attendances, source: :user

  def confirm_send
    AdminMailer.confirm_email(self).deliver_now
  end
end
