class Campsite < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :address, :description, presence: true
  validates :price_per_night, numericality: true
  validates :capacity, numericality: { only_integer: true }

  # geocode for map
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def rating
    rating = 0
    bookings.each do |booking|
      rating += booking.review.rating
    end
    return rating
  end
end
