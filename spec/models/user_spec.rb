require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user' do 
    User.create(first_name: 'bob', first_name: 'lenon', zip_code: 75000, town: "Butte chaumont")
    expect(User.count).to eq(1)
  end
end
