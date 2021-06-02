# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Campsite.destroy_all

# user_1 = User.create!(email:"hugo1@test.com", password:"123456")
# user_2 = User.create!(email:"afsaneh@test.com", password:"123456")
# user_3 = User.create!(email:"kosala@test.com", password:"123456")
# user_4 = User.create!(email:"rodrigo@test.com", password:"123456")

# Campsite.create!(name:"Site 1", address:"1 street london", description:"beautiful", price_per_night: 50, capacity: 5, user_id: user_1.id)
# Campsite.create!(name:"Site 2", address:"2 street london", description:"amazing", price_per_night: 10, capacity: 1, user_id: user_2.id)
# Campsite.create!(name:"Site 3", address:"3 street london", description:"nice", price_per_night: 70, capacity: 7, user_id: user_3.id)
# Campsite.create!(name:"Site 4", address:"4 street london", description:"lovely", price_per_night: 40, capacity: 3, user_id: user_4.id)

require 'faker'

# users who own Campsite
5.times {
  user = User.create!(email: Faker::Internet.email, password: "123456")

  rand(0..3).times {
    campsite = Campsite.create!({
      name: Faker::Company.name,
      address: Faker::Address.full_address,
      description: Faker::Lorem.sentence,
      price_per_night: rand(8..15),
      capacity: rand(5..8),
      user: user
    })

    if !campsite.nil?
      rand(1..3).times {
        renter = User.create!(email: Faker::Internet.email, password: "123456")

        booking = Booking.create!({
          campsite: campsite,
          user: renter,
          start_date: Date.today,
          end_date: Faker::Date.between(from: Date.today, to: 14.days.from_now),
          # total_price
          number_of_guest: rand(1..4)
          # status
        })
      }
    end

  }
}

# 10.times


