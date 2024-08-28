# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb
# db/seeds.rb

puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."

restaurants = [
  { name: "Epicure", address: "75008 Paris", phone_number: "01 47 00 00 00", category: "french" },
  { name: "Sushi Samba", address: "London", phone_number: "020 3640 7330", category: "japanese" },
  { name: "Pizza East", address: "Shoreditch, London", phone_number: "020 7729 1888", category: "italian" },
  { name: "Belga Queen", address: "Brussels", phone_number: "+32 2 217 21 87", category: "belgian" },
  { name: "Dragon", address: "Chinatown, NYC", phone_number: "212-555-1234", category: "chinese" }
]

restaurants.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "Created #{restaurant.name}"

  # Crear algunos reviews para cada restaurante
  rand(1..3).times do
    review = Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
    puts "Created review with rating #{review.rating} for #{restaurant.name}"
  end
end

puts "Finished!"
