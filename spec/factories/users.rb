FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    zip_code { 1 }
    town { "MyString" }
  end
end
