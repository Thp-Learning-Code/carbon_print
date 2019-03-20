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
ActiveRecord::Base.connection.reset_pk_sequence!('ratios')

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


# 5.times do |i|
#   Footprint.create!(delivery_address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, town: "Paris", country: "France", user_id: User.all.sample.id, product_id: Product.all.sample.id)
# end
# puts "Footprint created"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Ratio.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Ratio.new
  t.carbon_print_for_brand = row
  t.save
  puts "Ratio saved"
end

puts "There are now #{Ratio.count} rows in the Ratio table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Value.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Value.new
  t.carbon_print = row
  t.save
  puts "Value saved"
end

puts "There are now #{Value.count} rows in the Value table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Brand.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1', :col_sep => ';')
csv.each do |row|
  t = Brand.new
  t.name = row[0]
  t.ratio_id = row[1]
  t.save
  puts "Brand saved"
end

puts "There are now #{Brand.count} rows in the Brand table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Type.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1', :col_sep => ';')
csv.each do |row|
  t = Type.new
  t.name = row[0]
  t.value_id = row[1]
  t.save
  puts "Type saved"
end

puts "There are now #{Type.count} rows in the Type table"

5.times do |i|
  Product.create!(title: Faker::Name.first_name, description: Faker::WorldCup.team, price: rand(1..30),city: "Londres", country: "Angleterre", type_id: Type.all.sample.id, brand_id: Brand.all.sample.id)
end

puts "Footprint created"



User.create(first_name: "admin", last_name:"one" ,   zip_code: 75015, town:"Orleans",     email: "admin1@gmail.com", country: "France" , is_admin: true , password:123456)
User.create(first_name: "admin", last_name:"two" ,   zip_code: 75015, town:"Paris" ,      email: "admin1@gmail.com", country: "France" , is_admin: true , password:123456)
User.create(first_name: "admin", last_name:"three",  zip_code: 75015, town:"Lille" ,      email: "admin1@gmail.com", country: "France" , is_admin: true , password:123456)
User.create(first_name: "admin", last_name:"four",   zip_code: 75015, town:"Marseille" ,  email: "admin1@gmail.com", country: "France" , is_admin: true , password:123456)
puts "4 user Ceated"
