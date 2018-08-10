# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |num|
  User.create!(email: "test#{num}@kc.com",
               username: "sneakerhead#{num}",
               password: "password",
               reputation: rand(1..9)
              )
end


brands = ["Jordan", "Nike", "Adidas", "New Balance"]

brands.length.times do |b|
  Brand.create!(name: brands[b])
end

puts "5 brands created!"
