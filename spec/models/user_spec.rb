require 'rails_helper'

RSpec.describe User, type: :model do
  it "shouldn't create a user " do 
    User.create(first_name: 'bob', zip_code: 75000, town: 'Butte chaumont')
    expect(User.count).to eq(0)
  end
  it "shouldn't create a user " do 
    User.create(first_name: 'bob', last_name: 'lenon', town: 'Butte chaumont')
    expect(User.count).to eq(0)
  end
  it "shouldn't create a user " do 
    User.create(last_name: 'lenon', zip_code: 75000, town: 'Butte chaumont')
    expect(User.count).to eq(0)
  end
<<<<<<< HEAD

  context "association" do
    describe "user" do
      it {should have_many(:products).through(:footprints)}
    end
    describe "user" do
      it {should have_many(:footprints)}
    end
  end

end
=======
  it "should create a user" do
    User.create(first_name: 'bob', last_name: 'lenon', zip_code: 75000, town: 'Butte chaumont')
    expect(User.count).to eq(1)
  end
end
>>>>>>> development
