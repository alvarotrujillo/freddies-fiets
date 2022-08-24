# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"


puts "Cleaning database..."
puts "... bikes"
Bike.destroy_all
puts "... users"
User.destroy_all
puts "Database is clean."

# Test User Credentials below!
Freddie = User.create!(email: "freddie@test.com", first_name: "Freddie", last_name: "Mercury", password: 'batch929')

puts User.first.id

puts 'Creating 10 + 1 users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'batch929'
  )
  user.save!
end

# first_name, last_name, email, password

puts "Finished creating #{User.count} users"

puts 'Initializing bikes creation'
increment = 0 # var used to select different pics

# Test Bikes Credentials for Freddie user below!


bike = Bike.new(
  name: "Folding Bike",
  bike_type: "City bike",
  location: "Diemen",
  description: "The perfect solution for a hybrid commute as you can fold it and carry in the public transport",
  gears: "7",
  hand_brakes: true,
  price: 60,
  active: true,
  user_id: User.first.id
)
file = URI.open("https://res.cloudinary.com/lluz/image/upload/v1661330526/Screenshot_2022-08-24_at_10.41.02_dtdds0.png")
bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bike.save!
bike = Bike.new(
  name: "Crazy Orange",
  bike_type: "Fixie bike",
  location: "Diemen",
  description: "The ultimate hipster bike at your service",
  gears: "No gears",
  hand_brakes: true,
  price: 35,
  active: true,
  user_id: User.first.id
)
file = URI.open("https://res.cloudinary.com/lluz/image/upload/v1661330517/Screenshot_2022-08-24_at_10.37.37_xcqypm.png")
bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bike.save!
bike = Bike.new(
  name: "Sparta Mojo",
  bike_type: "City bike",
  location: "Diemen",
  description: "The all around dutch bike with, full of storage and optional Baby Carrier",
  gears: "7",
  hand_brakes: true,
  price: 75,
  active: true,
  user_id: User.first.id
)
file = URI.open("https://res.cloudinary.com/lluz/image/upload/v1661330514/Screenshot_2022-08-24_at_10.35.10_efvmla.png")
bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bike.save!
bike = Bike.new(
  name: "Rat bike (Brooks saddle)",
  bike_type: "Single-speed bike",
  location: "Diemen",
  description: "Fast define this low maintenance bike",
  gears: "7",
  hand_brakes: false,
  price: 50,
  active: true,
  user_id: User.first.id
)
file = URI.open("https://res.cloudinary.com/lluz/image/upload/v1661330512/Screenshot_2022-08-24_at_10.30.11_gsytky.png")
bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bike.save!


puts 'Creating 10 road bikes...'
road_10pics = %w[
  v1661180401/FreddieFiets/road10_tyu1x7.png
  v1661180401/FreddieFiets/road9_pkg47o.png
  v1661180401/FreddieFiets/road8_factht.png
  v1661180401/FreddieFiets/road7_viwzai.png
  v1661180400/FreddieFiets/road6_o7yep6.png
  v1661180400/FreddieFiets/road5_g0gypn.png
  v1661180400/FreddieFiets/road4_wlxoll.png
  v1661180400/FreddieFiets/road3_ftz3t2.png
  v1661180401/FreddieFiets/road2_xsz7c4.png
  v1661180400/FreddieFiets/road1_dxpgsy.png
]
10.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: 'Road bike',
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: ['18', '21', '28'].sample,
    hand_brakes: true,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{road_10pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end
sleep 2
increment = 0
puts 'Creating 10 mtb bikes...'
mtb_10pics = %w[
  v1661180400/FreddieFiets/mtb9_trhsjd.png
  v1661180400/FreddieFiets/mtb10_a82keo.png
  v1661180399/FreddieFiets/mtb3_kxwcqj.png
  v1661180399/FreddieFiets/mtb8_nszgkr.png
  v1661180399/FreddieFiets/mtb4_tqtxmr.png
  v1661180399/FreddieFiets/mtb7_smu2vs.png
  v1661180399/FreddieFiets/mtb5_odackp.png
  v1661180399/FreddieFiets/mtb6_trnkiu.png
  v1661180398/FreddieFiets/mtb1_rbss82.png
  v1661180399/FreddieFiets/mtb2_xi2qop.png
]
10.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: 'Mountain bike',
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: ['18', '21', '28'].sample,
    hand_brakes: true,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{mtb_10pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end
sleep 2
increment = 0
puts 'Creating 10 fixie/singlespeed bikes...'
fixie_10pics = %w[
  v1661180398/FreddieFiets/fixie10_hcvcs7.png
  v1661180398/FreddieFiets/fixie9_rzj1gr.png
  v1661180398/FreddieFiets/fixie8_cvwxrl.png
  v1661180398/FreddieFiets/fixie7_u5iebu.png
  v1661180398/FreddieFiets/fixie6_uyux6h.png
  v1661180398/FreddieFiets/fixie5_x1sjah.png
  v1661180398/FreddieFiets/fixie4_dhmijg.png
  v1661180397/FreddieFiets/fixie3_welkw0.png
  v1661180398/FreddieFiets/fixie2_e5fm5x.png
  v1661180397/FreddieFiets/fixie1_b1frvw.png
]
10.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: ['Single-speed bike', 'Fixie bike'].sample,
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: 'No gears',
    hand_brakes: [true, false].sample,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{fixie_10pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end
  sleep 2
  increment = 0
puts 'Creating 10 city bikes...'
city_10pics = %w[
  v1661180397/FreddieFiets/city10_djr198.png
  v1661180397/FreddieFiets/city9_enyul5.png
  v1661180397/FreddieFiets/city8_glasuy.png
  v1661180397/FreddieFiets/city7_xudnyv.png
  v1661180396/FreddieFiets/city6_r9wtjd.png
  v1661180396/FreddieFiets/city5_skrzvh.png
  v1661180397/FreddieFiets/city4_c7wjdp.png
  v1661180396/FreddieFiets/city3_za1xe4.png
  v1661180396/FreddieFiets/city2_yptwxk.png
  v1661180396/FreddieFiets/city1_f3zoni.png
]
10.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: 'City bike',
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: ['3', '7', '18', '21'].sample,
    hand_brakes: [true, false].sample,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{city_10pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end
sleep 2
increment = 0
puts 'Creating 5 bmx bikes...'
bmx_5pics = %w[
  v1661180396/FreddieFiets/bmx5_wjkj2x.png
  v1661180396/FreddieFiets/bmx4_vsdri5.png
  v1661180396/FreddieFiets/bmx3_levwey.png
  v1661180395/FreddieFiets/bmx2_oidpaw.png
  v1661180395/FreddieFiets/bmx1_srijrh.png
]
5.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: 'BMX bike',
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: 'No gears',
    hand_brakes: [true, false].sample,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{bmx_5pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end
sleep 2
increment = 0
puts 'Creating 5 cargo bikes...'
cargo_5pics = %w[
  v1661180395/FreddieFiets/bakfiets5_cfbuay.png
  v1661180395/FreddieFiets/bakfiets4_ooaadj.png
  v1661180395/FreddieFiets/bakfiets3_sarycn.png
  v1661180395/FreddieFiets/bakfiets2_rft44f.png
  v1661180395/FreddieFiets/bakfiets1_hu23mr.png
]
5.times do
  bike = Bike.new(
    name: Faker::Music::RockBand.name,
    bike_type: "Cargo bike",
    location: %w[Almere Amsterdam Delft Dordrecht Haarlem The Hague Leiden Rotterdam Utrecht Zoetermeer].sample,
    description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    gears: ['No gears', '7', '21'].sample,
    hand_brakes: true,
    user: User.all.sample,
    price: rand(70..300)
  )
  file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{cargo_5pics[increment]}")
  bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  bike.save!
  increment += 1
  puts "#{Bike.count} bikes"
end

puts "Finished creating #{Bike.count} bikes!"
