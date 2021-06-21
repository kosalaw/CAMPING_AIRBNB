class Booking < ApplicationRecord
  belongs_to :campsite
  belongs_to :user
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?

  validates :number_of_guest, numericality: { only_integer: true }
  validates :number_of_guest, numericality: { greater_than_or_equal_to: 1 }
  validate :number_of_guest_less_or_equal_capacity?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def number_of_guest_less_or_equal_capacity?
    if number_of_guest.to_i > campsite.capacity.to_i
      errors.add :number_of_guest, "Guests exceed capacity"
    end
  end
end
