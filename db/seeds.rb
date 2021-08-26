# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "initialising seed"
Rental.destroy_all
Console.destroy_all
User.destroy_all
puts "cleaned database"

User.create(
    email: "test@test.com",
    password: "password",
    first_name: "tester",
    last_name: "testerson",
    address: "test drive, testville, los testos",
    phone_number: "07123456789"
)
puts "created test user account"

puts "generating users"
100.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code
  )
  puts "user #{user.first_name + user.last_name} generated" if user.save!
  rand(0..10).times do
    user.consoles.create(
      name: Faker::Game.platform,
      description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 245),
      price_per_day: rand(1.00..49.99),
      min_rental_time: rand(0..14),
      max_rental_time: rand(15..30)
    )
    puts "#console for #{user.first_name} generated"
  end
end

puts "database seeded"
