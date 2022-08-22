# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Creating 50 users...'
50.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
end

# first_name, last_name, email, password

puts 'Finished! creating fifty Users'

puts 'Creating 50 bikes...'
50.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    type: ['city bike', 'road bike', 'mountain bike'].sample,
    location: Faker::Address.city,
    description: Faker::Lorem,
    gears: ['1', '3', '7', '18', '21', '28'].sample,
    hand_brakes: [true, false].sample,
    user_id: (1..50).sample,
    price: (70..300).sample
  )
  bike.save!
end

# Name, type, location, description, photo, gears, hand-brakes?, user_id, price

puts 'Finished creating 50 bikes!'
