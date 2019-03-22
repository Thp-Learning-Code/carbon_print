require 'rails_helper'

RSpec.describe User, type: :model do
before(:each) do
  @user = User.create(first_name: "Bimss", last_name: "Golf", email: "bimss@gmail.com", password: "1234563", address: "28 bolivar", zip_code: 75019, town: "Paris")
end

it "has a valid User" do
  expect(@user).to be_a(User)
end

context "validation" do

  it "is valid with valid attributes" do
    expect(@user).to be_a(User)
  end

  # describe "#email" do
  #   it { expect(@user).to validate_presence_of(:email) }
  # end

  # describe "#last_name" do
  #   it { expect(@user).to validate_presence_of(:last_name) }
  # end

  # describe "#zip_code" do
  #   it { expect(@user).to validate_length_of(:zip_code), minimum: 5 }
  # end

  # describe "#password" do
  #   it { expect(@user).to validate_length_of(:password), minimum: 6 }
  # end
end

  # context "association" do
  #   describe "user" do
  #     it {should have_many(:products).through(:footprints)}
  #   end
  #   describe "user" do
  #     it {should have_many(:footprints)}
  #   end
  # end
end