require 'faker'

Footprint.delete_all
User.delete_all
Product.delete_all
Value.delete_all
Type.delete_all
Ratio.delete_all
Brand.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('footprints')
ActiveRecord::Base.connection.reset_pk_sequence!('values')
ActiveRecord::Base.connection.reset_pk_sequence!('types')
ActiveRecord::Base.connection.reset_pk_sequence!('brands')

3.times do |i|
 User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, country:"France" , town:"Paris", zip_code:75018)
end
3.times do |i|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, country:"France" , town:"Marseille", zip_code:75018)
 end
 3.times do |i|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, country:"France" , town:"Lyon", zip_code:75018)
 end
puts "Users created"
User.create(first_name: "sjdskdjk", last_name: "jiad", address: nil, zip_code: 75015, town: "Paris",email: "pam@pam.pam",country: "France", is_admin: true)


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
  Product.create!(title: Faker::Name.first_name, description: Faker::WorldCup.team, price: rand(1..30),city: "Londres", country: "Angleterre", type_id: Type.all.sample.id, brand_id: Brand.all.sample.id)
end
puts "Products created"

5.times do |i|
  Footprint.create!(delivery_address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, town: "Paris", country: "France", user_id: User.all.sample.id, product_id: Product.all.sample.id)
end
puts "Footprint created"

User.create(first_name: "user1", last_name: "admin", address: nil, zip_code: 75015, town: "Paris",      email: "admin1@gmail.com",country: "France", password:123456, is_admin: true)
User.create(first_name: "user2", last_name: "admin", address: nil, zip_code: 75012, town: "Marseille",  email: "admin2@gmail.com",country: "France", password:123456, is_admin: true)
User.create(first_name: "user3", last_name: "admin", address: nil, zip_code: 75018, town: "Lyon",       email: "admin3@gmail.com",country: "France", password:123456, is_admin: true)
User.create(first_name: "user4", last_name: "admin", address: nil, zip_code: 75015, town: "Paris",      email: "admin4@gmail.com",country: "France", password:123456, is_admin: true)
puts "5 user Ceated"