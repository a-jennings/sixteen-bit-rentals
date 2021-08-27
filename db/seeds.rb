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

test_user = User.create(
  email: "test@test.com",
  password: "password",
  first_name: "tester",
  last_name: "testerson",
  address: "test drive, testville, los testos",
  phone_number: "07123456789",
  about: Faker::Lorem.sentence(word_count: rand(0..20))
)

test_user2 = User.new(
  email: "test2@test.com",
  password: "password",
  first_name: "testy",
  last_name: "testerburger",
  address: "test avenue, teston, testvania",
  phone_number: "07234567890",
  about: Faker::Lorem.sentence(word_count: rand(0..20))
)
puts "created test user accounts" if test_user.save! && test_user2.save!

4.times do
  console_test = test_user.consoles.new(
    name: Faker::Game.platform,
    description: Faker::Lorem.sentence(word_count: rand(10..20)),
    price_per_day: rand(0.00..99.99),
    min_rental_time: rand(0..14),
    max_rental_time: rand(15..30),
  )
  puts "generated console for test user account" if console_test.save!
end

puts "generating users"
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    about: Faker::Lorem.sentence(word_count: rand(0..20))
  )
  puts "user #{user.first_name} generated" if user.save!
  rand(0..5).times do
    user.consoles.create(
      name: Faker::Game.platform,
      description: Faker::Lorem.sentence(word_count: rand(10..20)),
      price_per_day: rand(1.00..49.99),
      min_rental_time: rand(0..14),
      max_rental_time: rand(15..30)
    )
    puts "#console for #{user.first_name} generated"
  end
end

puts "database seeded"
