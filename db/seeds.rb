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
Type.delete_all
Value.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('footprints')
ActiveRecord::Base.connection.reset_pk_sequence!('types')
ActiveRecord::Base.connection.reset_pk_sequence!('values')

5.times do |i|
 User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
puts "Users created"

5.times do |i|
  Value.create!(carbon_print: rand(1..30))
end
puts "Value created"

5.times do |i|
  Type.create!(name: "hola", value_id: Value.all.sample.id )
end
puts "Type created"

5.times do |i|
  Ratio.create!(carbon_print_for_brand: rand(1..30))
end
puts "Ratio created"

5.times do |i|
  Brand.create!(name: Faker::WorldCup.group, ratio_id: Value.all.sample.id )
end
puts "Brand created"


5.times do |i|
  Product.create!(title: Faker::Name.first_name, description: Faker::WorldCup.team, price: rand(1..30), type_id: Type.all.sample.id, brand_id: Brand.all.sample.id)
end
puts "Products created"

5.times do |i|
  FootPrint.create!(delivery_address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, user_id: User.all.sample.id, product_id: Product.all.sample.id )
end
puts "Footprint created"
