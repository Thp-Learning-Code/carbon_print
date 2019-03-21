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
Footprint.delete_all
Value.delete_all
Type.delete_all
Ratio.delete_all
Brand.delete_all
Warehouse.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('footprints')
ActiveRecord::Base.connection.reset_pk_sequence!('values')
ActiveRecord::Base.connection.reset_pk_sequence!('types')
ActiveRecord::Base.connection.reset_pk_sequence!('brands')
ActiveRecord::Base.connection.reset_pk_sequence!('ratios')
ActiveRecord::Base.connection.reset_pk_sequence!('warehouses')


3.times do |i|
 User.create!(first_name: Faker::Name.first_name + "fodesse", last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 123456, country:"France" , town:"Paris", zip_code:75018)

end
puts "Users created"

3.times do |i|
User.create(first_name: "user#{i}", last_name: "admin#{i}", address: "100 bd bidon", zip_code: 75012, town: "Marseille",  email: "admin2@gmail.com",country: "France", password:123456, is_admin: true)
end 
puts "3 Users Ceated"

# 5.times do |i|
#   Footprint.create!(delivery_address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, town: "Paris", country: "France", user_id: User.all.sample.id, product_id: Product.all.sample.id)
# end
# puts "Footprint created"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Ratio.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Ratio.new
  t.carbon_print_for_brand = row[0]
  t.save
  puts "Ratio saved"
end
puts "Value created"

puts "There are now #{Ratio.count} rows in the Ratio table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Value.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Value.new
  t.carbon_print = row[0]
  t.save
  puts "Value saved"
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


csv_text = File.read(Rails.root.join('lib', 'seeds', 'Warehouse.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1', :col_sep => ';')
csv.each do |row|
  t = Warehouse.new
  t.name = row[0]
  t.address = row[1]
  t.zip_code = row[2]
  t.city = row[3]
  t.country = row[4]
  t.save
  puts "Warehouse saved"
end

puts "There are now #{Warehouse.count} rows in the Warehouse table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Product.csv'))
csv = CSV.parse(csv_text, :headers => true,:encoding => 'ISO-8859-1', :col_sep => ';')
csv.each do |row|
  t = Product.create( title: row[0], type_id: row[1], brand_id: row[2], warehouse_id: row[3])
  puts "Product saved"
end

puts "There are now #{Product.count} rows in the Product table"