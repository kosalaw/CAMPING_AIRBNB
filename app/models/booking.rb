class Booking < ApplicationRecord
  belongs_to :campsite
  belongs_to :user

  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :number_of_guest, numericality: { only_integer: true }
end
