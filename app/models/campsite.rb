class Campsite < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :address, :description, presence: true
  # validates :address, presence: true
  # validates :description, presence: true

  validates :price_per_night, numericality: true

  validates :capacity, numericality: { only_integer: true }
end
