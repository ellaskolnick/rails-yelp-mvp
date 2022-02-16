# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CATEGORIES = %w[chinese italian japanese french belgian].freeze

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: CATEGORIES.sample
  )
  restaurant.save!
end
