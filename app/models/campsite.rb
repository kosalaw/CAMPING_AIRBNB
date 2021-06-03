class Campsite < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :address, :description, presence: true
  # validates :address, presence: true
  # validates :description, presence: true

  validates :price_per_night, numericality: true

  validates :capacity, numericality: { only_integer: true }
end
