# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.delete_all
Product.delete_all
FootPrint.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
# ActiveRecord::Base.connection.reset_pk_sequence!('footprints')


5.times do |i|
 User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
puts "Users created"

5.times do |i|
  Product.create!(title: Faker::Name.first_name, description: "Moi,Moche et Méchant. Allez acheter cette putain de photo !", price: rand(1..30))
end
puts "Products created"

5.times do |i|
  FootPrint.create!(delivery_address: "Rue du pont", zip_code: "93000", user_id: User.all.sample.id, product_id: Product.all.sample.id )
end
puts "Footprint created"
