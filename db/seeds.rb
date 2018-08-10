# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |num|
  User.create!(email: "sneakerhead#{num}@kc.com",
               username: "sneakerhead#{num}",
               password: "password").shoes.create!(
                 name: "Yeezy",
                 price: 600,
                 brand: "Adidas"
               )
end

puts '5 Users & their shoe created!'

brands = ["Jordan", "Nike", "Adidas", "Yeezy", "New Balance"]

brands.length.times do |b|
  Brand.create!(name: brands[b])
end

puts "5 brands created!"
