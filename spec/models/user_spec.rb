require 'rails_helper'

RSpec.describe User, type: :model do
before(:each) do
  @user = User.create(first_name: "Bimss", last_name: "Golf", email: "bimss@gmail.com", password: "1234563", address: "28 bolivar", zip_code: 75019, town: "Paris")
end



# context "validation" do

#   it "create user" do
#     expect(@user).to be_a(User)
#   end

#   describe "#email" do
#     it { expect(@user).to validate_presence_of(:email) }
#   end

#   # describe "#last_name" do
#   #   it { expect(@user).to validate_presence_of(:last_name) }
#   # end

#   # describe "#zip_code" do
#   #   it { expect(@user).to validate_length_of(:zip_code), minimum: 5 }
#   # end

#   # describe "#password" do
#   #   it { expect(@user).to validate_length_of(:password), minimum: 6 }
#   # end
# end

#   # context "association" do
#   #   describe "user" do
#   #     it {should have_many(:products).through(:footprints)}
#   #   end
#   #   describe "user" do
#   #     it {should have_many(:footprints)}
#   #   end
#   # end
# end



context "validation" do

  it "is valid with valid attributes" do
    expect(@user).to be_a(User)
    expect(@user).to be_valid
  end

  describe "#first_name" do
    it "should not be valid without first_name" do
      bad_user = User.create(first_name: "Do")
      expect(bad_user).not_to be_valid
      # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
      expect(bad_user.errors.include?(:first_name)).to eq(true)
    end
  end

  describe "#email" do
    it "should not be valid without email" do
      bad_user = User.create(email: "John")
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:email)).to eq(true)
    end
  end

end

context "associations" do

  describe "product" do
    it "should have_many books" do
      product = Product.create(user: @user)
      expect(@user.books.include?(book)).to eq(true)
    end
  end

end


end 

# context "public instance methods" do

#   describe "#full_name" do

#     it "should return a string" do
#       expect(@user.full_name).to be_a(String)
#     end

#     it "should return the full name" do
#       user_1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe")
#       expect(user_1.full_name).to eq("John Doe")
#       user_2 = User.create(first_name: "Jean-Michel", last_name: "Durant", username: "kikou_du_75")
#       expect(user_2.full_name).to eq("Jean-Michel Durant")
#     end
#   end

# end