# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"


puts "Cleaning database..."
puts "... users"
User.destroy_all
puts "... bikes"
Bike.destroy_all
puts "Database is clean."


puts 'Creating 50 users...'
50.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'batch929'
  )
  user.save!
end

# first_name, last_name, email, password

puts 'Finished! creating fifty Users'

puts 'Initializing bikes creation'
increment = 0 # var used to select different pics

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
      location: Faker::Address.city,
      description: Faker::Lorem,
      gears: ['18', '21', '28'].sample,
      hand_brakes: true,
      user: User.all.sample,
      price: rand(70..300)
    )
    file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{road_10pics[increment]}")
    bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    bike.save!
    increment += 1
  end

# puts 'Creating 10 mtb bikes...'
#   mtb_10pics = %w[
#     v1661180400/FreddieFiets/mtb10_a82keo.png
#     v1661180400/FreddieFiets/mtb9_trhsjd.png
#     v1661180399/FreddieFiets/mtb8_nszgkr.png
#     v1661180399/FreddieFiets/mtb3_kxwcqj.png
#     v1661180399/FreddieFiets/mtb7_smu2vs.png
#     v1661180399/FreddieFiets/mtb4_tqtxmr.png
#     v1661180399/FreddieFiets/mtb6_trnkiu.png
#     v1661180399/FreddieFiets/mtb5_odackp.png
#     v1661180399/FreddieFiets/mtb2_xi2qop.png
#     v1661180398/FreddieFiets/mtb1_rbss82.png
#   ]
#   10.times do
#     bike = Bike.new(
#       name: Faker::Music::RockBand.name,
#       bike_type: 'Mountain bike',
#       location: Faker::Address.city,
#       description: Faker::Lorem,
#       gears: ['18', '21', '28'].sample,
#       hand_brakes: true,
#       user: User.all.sample,
#       price: rand(70..300)
#     )
#     file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{mtb_10pics[increment]}")
#     bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#     bike.save!
#     increment += 1
#   end

# puts 'Creating 10 fixie/singlespeed bikes...'
#   fixie_10pics = %w[
#     v1661180398/FreddieFiets/fixie10_hcvcs7.png
#     v1661180398/FreddieFiets/fixie9_rzj1gr.png
#     v1661180398/FreddieFiets/fixie8_cvwxrl.png
#     v1661180398/FreddieFiets/fixie7_u5iebu.png
#     v1661180398/FreddieFiets/fixie6_uyux6h.png
#     v1661180398/FreddieFiets/fixie5_x1sjah.png
#     v1661180398/FreddieFiets/fixie4_dhmijg.png
#     v1661180397/FreddieFiets/fixie3_welkw0.png
#     v1661180398/FreddieFiets/fixie2_e5fm5x.png
#     v1661180397/FreddieFiets/fixie1_b1frvw.png
#   ]
#   10.times do
#     bike = Bike.new(
#       name: Faker::Music::RockBand.name,
#       bike_type: ['Single-speed bike', 'Fixie bike'].sample,
#       location: Faker::Address.city,
#       description: Faker::Lorem,
#       gears: 'No gears',
#       hand_brakes: [true, false].sample,
#       user: User.all.sample,
#       price: rand(70..300)
#     )
#     file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{fixie_10pics[increment]}")
#     bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#     bike.save!
#     increment += 1
#   end

# puts 'Creating 10 city bikes...'
#   city_10pics = %w[
#     v1661180397/FreddieFiets/city10_djr198.png
#     v1661180397/FreddieFiets/city9_enyul5.png
#     v1661180397/FreddieFiets/city8_glasuy.png
#     v1661180397/FreddieFiets/city7_xudnyv.png
#     v1661180396/FreddieFiets/city6_r9wtjd.png
#     v1661180396/FreddieFiets/city5_skrzvh.png
#     v1661180397/FreddieFiets/city4_c7wjdp.png
#     v1661180396/FreddieFiets/city3_za1xe4.png
#     v1661180396/FreddieFiets/city2_yptwxk.png
#     v1661180396/FreddieFiets/city1_f3zoni.png
#   ]
#   10.times do
#     bike = Bike.new(
#       name: Faker::Music::RockBand.name,
#       bike_type: 'City bike',
#       location: Faker::Address.city,
#       description: Faker::Lorem,
#       gears: ['3', '7', '18', '21'].sample,
#       hand_brakes: [true, false].sample,
#       user: User.all.sample,
#       price: rand(70..300)
#     )
#     file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{city_10pics[increment]}")
#     bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#     bike.save!
#     increment += 1
#   end

# puts 'Creating 5 bmx bikes...'
#   bmx_5pics = %w[
#     v1661180396/FreddieFiets/bmx5_wjkj2x.png
#     v1661180396/FreddieFiets/bmx4_vsdri5.png
#     v1661180396/FreddieFiets/bmx3_levwey.png
#     v1661180395/FreddieFiets/bmx2_oidpaw.png
#     v1661180395/FreddieFiets/bmx1_srijrh.png
#   ]
#   5.times do
#     bike = Bike.new(
#       name: Faker::Music::RockBand.name,
#       bike_type: 'BMX bike',
#       location: Faker::Address.city,
#       description: Faker::Lorem,
#       gears: 'No gears',
#       hand_brakes: [true, false].sample,
#       user: User.all.sample,
#       price: rand(70..300)
#     )
#     file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{bmx_5pics[increment]}")
#     bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#     bike.save!
#     increment += 1
#   end

# puts 'Creating 5 cargo bikes...'
#   cargo_5pics = %w[
#     v1661180395/FreddieFiets/bakfiets5_cfbuay.png
#     v1661180395/FreddieFiets/bakfiets4_ooaadj.png
#     v1661180395/FreddieFiets/bakfiets3_sarycn.png
#     v1661180395/FreddieFiets/bakfiets2_rft44f.png
#     v1661180395/FreddieFiets/bakfiets1_hu23mr.png
#   ]
#   5.times do
#     bike = Bike.new(
#       name: Faker::Music::RockBand.name,
#       bike_type: "Cargo bike",
#       location: Faker::Address.city,
#       description: Faker::Lorem,
#       gears: ['No gears', '7', '21'].sample,
#       hand_brakes: true,
#       user: User.all.sample,
#       price: rand(70..300)
#     )
#     file = URI.open("https://res.cloudinary.com/lluz/image/upload/#{cargo_5pics[increment]}")
#     bike.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#     bike.save!
#     increment += 1
#   end

# Name, type, location, description, photo, gears, hand-brakes?, user_id, price

puts 'Finished creating 50 bikes!'
