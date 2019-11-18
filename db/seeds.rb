# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Removing Materials and Swaps..."
Material.destroy_all
Swap.destroy_all

puts "Creating new Materials"
descrp_mat = %w[cardboard newspaper glass aluminium plastic]
30.times do
  Material.create!(description: descrp_mat.sample, amount: "#{rand(1..100)} Kg")
end
