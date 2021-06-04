require 'faker'
require "open-uri"

Review.destroy_all
Booking.destroy_all
Campsite.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.create!(email: "test@test.com", password: "123456")
user_2 = User.create!(email: "test2@test.com", password: "123456")
user_3 = User.create!(email: Faker::Internet.email, password: "123456")
user_4 = User.create!(email: Faker::Internet.email, password: "123456")
user_5 = User.create!(email: Faker::Internet.email, password: "123456")


puts "Creating campsites..."
file_1 = URI.open('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/22/a0/8a/pine-flats-campground.jpg?w=900&h=-1&s=1')
campsite_1 = Campsite.create!({
  name: "Pine Flat Campground",
  address: "12240 AZ-89A, Sedona, AZ 86336, United States",
  description: "Campground in a pine forest offering outdoor activities like swimming, hiking & trout fishing",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_1
  })
campsite_1.photo.attach(io: file_1, filename: 'pine-flats-campground.jpg', content_type: 'image/jpg')

file_2 = URI.open('https://www.tripsavvy.com/thmb/szHuEuiYERlhXo58KYVfKDpQXVM=/2309x1299/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-114565018-5c2fa1f046e0fb00016f3d95.jpg')
campsite_2 = Campsite.create!({
  name: "Nevada Beach Campground",
  address: "Spring Creek, NV 89815, United States",
  description: "Nevada Beach Campground and Day Use Pavilion sits in the Lake Tahoe Basin of Nevada. Minutes from the bright blue water of Tahoe's eastern shores, campsites are nestled in a sparse forest of pine trees and evergreen shrubs. The lake and its sandy beaches provides ample recreation opportunities and restaurants and casinos are just moments away.",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_1
  })
campsite_2.photo.attach(io: file_2, filename: 'GettyImages-114565018-5c2fa1f046e0fb00016f3d95.jpg', content_type: 'image/jpg')

file_3 = URI.open('https://fwp.mt.gov/binaries/content/gallery/mtfwpproject/fwpimageset/imagegalleries/stateparks/flatheadlake/wayfarers-1.jpg')
campsite_3 = Campsite.create!({
  name: "Wayfarers Campground",
  address: "8600 Montana Hwy 35, Bigfork, MT 59911, United States",
  description: "The rocky cliffs along the shoreline offer beautiful vistas of the lake at any time of day. Enjoy camping, boating, swimming.",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_2
  })
campsite_3.photo.attach(io: file_3, filename: 'wayfarers-1.jpg', content_type: 'image/jpg')

file_4 = URI.open('https://www.planetware.com/wpimages/2019/07/california-big-sur-best-campgrounds-ventana-campground.jpg')
campsite_4 = Campsite.create!({
  name: "Pfeiffer Big Sur Campground",
  address: "Pfeiffer Big Sur Rd, Big Sur, CA 93920, United States",
  description: "1,000-acre state park boasts a wide variety of hiking trails, wildlife, campgrounds & a guest lodge.",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_2
  })
campsite_4.photo.attach(io: file_4, filename: 'california-big-sur-best-campgrounds-ventana-campground.jpg', content_type: 'image/jpg')

file_5 = URI.open('https://playestacada.com/wp-content/uploads/sites/2/2018/07/estacada-009-1024x768.jpg')
campsite_5 = Campsite.create!({
  name: "Promontory Park Campground",
  address: "40600 OR-224, Estacada, OR 97023, United States",
  description: "Promontory Park is a family-friendly, alcohol-free campground on the North Fork Reservoir of the Clackamas River with a variety of camping options.",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_3
  })
campsite_5.photo.attach(io: file_5, filename: 'estacada-009-1024x768.jpg', content_type: 'image/jpg')

file_6 = URI.open('https://www.getoutwiththekids.co.uk/wp-content/uploads/formidable/13/Camping-1-1024x683.jpg')
campsite_6 = Campsite.create!({
  name: "Camp Fire Pit",
  address: "Shore Loop Rd, Seattle, WA 98118, United States",
  description: "The 17-acre state park offers 2,300 feet of Pacific Ocean beachfront and activities that include picnicking, camping, fishing, swimming, clam digging, and beachcombing.",
  price_per_night: rand(8..15),
  capacity: rand(5..8),
  user: user_3
  })
campsite_6.photo.attach(io: file_6, filename: 'Camping-1-1024x683.jpg', content_type: 'image/jpg')

puts "Creating bookings..."
booking_1 = Booking.create!({
  campsite: campsite_1,
  user: user_1,
  start_date: Date.today,
  end_date: Faker::Date.between(from: Date.today, to: 14.days.from_now),
  # total_price
  number_of_guest: rand(1..4)
  # status
})

booking_2 = Booking.create!({
  campsite: campsite_2,
  user: user_1,
  start_date: Date.today,
  end_date: Faker::Date.between(from: Date.today, to: 14.days.from_now),
  # total_price
  number_of_guest: rand(1..4)
  # status
})








