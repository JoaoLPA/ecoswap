# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Removing Materials and Swaps..."
Swap.destroy_all
Material.destroy_all
User.destroy_all

puts "Creating new Users"
5.times do
  User.create!(email: Faker::Internet.email, password: "supersenha", password_confirmation: "supersenha")
end

puts "Creating new Materials"
descrip_mat = %w[cardboard newspaper glass aluminium plastic]
users = User.all

30.times do
  Material.create!(description: descrip_mat.sample, amount: "#{rand(1..100)} Kg", location: "Rua #{Faker::Name.name}, #{rand(13..999)}", available: true, price: 0, user_id: users.sample.id )
end

puts "Creating some Ecoswaps"
materials = Material.all

materials.each do |material|
  rand_number = rand(1..100)
  if rand_number < 25
    Swap.create!(user_id: users.sample.id, material_id: material.id)
    material.available = false
    material.save
  end
end
