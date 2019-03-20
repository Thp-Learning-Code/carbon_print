FactoryBot.define do
  factory :user do
<<<<<<< HEAD
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    zip_code { 75000 }
    password { 123456 }
    town {"paris"}
    country {"France"}
=======
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    zip_code { 1 }
    town { "MyString" }
>>>>>>> 0f44e1701731aacc5664ed6b2f5cf7ab857f44aa
  end
end
