require 'rails_helper'

RSpec.describe User, type: :model do
before(:each) do
  @user = User.create(first_name: "Bimss", last_name: "Golf", email: "bimss@gmail.com", password: "1234563", address: "28 bolivar", zip_code: 75019, town: "Paris")
end

  context "validation" do

      it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end

  describe 'Names' do
    it 'is not valid without first_name' do
      bad_event = FactoryBot.build(:user, first_name: nil)
      expect(bad_event).not_to be_valid
      expect(bad_event.errors.include?(:first_name)).to eq(true)
    end
  end

  context "public instance methods" do
    describe "should return :" do
      it 'string' do
        expect(@user.first_name).to be_a(String)
        expect(@user.last_name).to be_a(String)
        expect(@user.email).to be_a(String)
      end
    end
  end
  
end