FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    zip_code { 75000 }
    password { 123456 }
    town {"paris"}
    country {"France"}
  end
end
