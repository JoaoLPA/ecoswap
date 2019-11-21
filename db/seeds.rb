# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Removing Materials and Swaps..."

​
puts "Creating new Users"
User.create!(email: "teste@teste.com.br", password: "supersenha", password_confirmation: "supersenha")
10.times do
  User.create!(email: Faker::Internet.email, password: "supersenha", password_confirmation: "supersenha")
end
​
puts "Creating the Materials"
names = %w[cardboard newspaper glass aluminium plastic]
​
names.each do |name|
  Material.create!(name: name)
end
​
puts "Creating some offers"
​
users = User.all
materials = Material.all
photos = ["image/upload/v1574279123/hb0it360vsb8orhlbs4v.jpg", "image/upload/v1574279095/froxpa9qcngdl2qirwqu.jpg", "image/upload/v1574279070/vc6oehtoh3dpjxa2tmmd.jpg"]
​
 20.times do
  Offer.create!(description: "A bucket full of #{Faker::Hipster.words}", amount: rand(1..100), unit: "Kg", price: 0, user: users.sample, material: materials.sample, photo: photos.sample)
 end
​
puts "Creating some Ecoswaps"
offers = Offer.all
offers.each do |offer|
  if offer.material == "cardboard"
    Swap.create!(user_id: users.sample.id, offer_id: offer.id)
    offer.available = false
    offer.save
  end
# offers.each do |offer|
#   rand_number = rand(1..100)
#   if rand_number < 25
#     Swap.create!(user_id: users.sample.id, offer_id: offer.id)
#     offer.available = false
#     offer.save
#   end
end
