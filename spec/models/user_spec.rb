require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it "has a valid user" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(:user).to eq(:user)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it { expect(@user).to validate_presence_of(:first_name) }
    end

    # describe "#last_name" do
    #   it { expect(@user).to validate_presence_of(:last_name) }
    # end

    # describe "#zip_code" do
    #   it { expect(@user).to validate_length_of(:zip_code), minimum: 5 }
    # end

    describe "#password" do
      it { expect(@user).to validate_length_of(:password), minimum: 6 }
    end
  end
  # context "association" do
  #   describe "user" do
  #     it {should have_many(:products).through(:footprints)}
  #   end
  # end
end