require 'rails_helper'

RSpec.describe Footprint, type: :model do
  before(:each) do
    @user = User.create(first_name: "Bimss", last_name: "Golf", email: "bimss@gmail.com", password: "1234563", address: "28 bolivar", zip_code: 75019, town: "Paris")
    value = Value.create(carbon_print: 21)
    type = Type.create(name: "jeans", value_id: value.id)
    ratio = Ratio.create(carbon_print_for_brand: 18)
    brand = Brand.create(name: 'Apple', ratio_id: ratio.id)
    warehouse = Warehouse.create(name: "Amazon", address: "1 rue Amazon", zip_code: 75001, country: "France", city: "Paris")
   @product = Product.create(title: "Iphone", brand_id: brand.id, type_id: type.id, price: 18, description: "smartphone Apple", warehouse_id: warehouse.id)
   @footprint = Footprint.create(delivery_address: "28 rue bolivar", zip_code: 75019, town: "paris", country: "France", user_id: @user.id, product_id: @product.id)
  end

  context "validation" do

    it "is valid with valid attributes" do
    expect(@footprint).to be_a(Footprint)
    expect(@footprint).to be_valid
    end
  end

  context "public instance methods" do
    describe "should return :" do
      it 'string' do
        expect(@footprint.delivery_address).to be_a(String)
        expect(@footprint.town).to be_a(String)
        expect(@footprint.country).to be_a(String)
      end
    end
  end
  

end
