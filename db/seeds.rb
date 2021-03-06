# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Review.destroy_all
Restaurant.destroy_all

puts 'Creating new restaurants'

30.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample,
    chef_name: %w[Dumas Lepes Petrona Mallmann Massey Botana].sample
  )
  restaurant.save!
  puts "Created restaurant with id #{restaurant.id}"
  puts "Creating reviews for restaurant #{restaurant.id}"
  rand(7..14).times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
    review.save!
  end
  restaurant.average_rating
  restaurant.save!
end

puts 'Finished!'
