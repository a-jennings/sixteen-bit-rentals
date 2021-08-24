# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Console.destroy_all

User.create(
    email: "test@test.com",
    password: "password",
    first_name: "tester",
    last_name: "testerson",
    address: "test drive, testville, los testos",
    phone_number: "07123456789"
)

100.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code
  )
  rand(0..10).times do
    user.consoles.create(
      name: Faker::Game.platform,
      price_per_day: rand(0.00..99.99),
      min_rental_time: rand(0..14),
      max_rental_time: rand(15..30)
    )
  end
end
