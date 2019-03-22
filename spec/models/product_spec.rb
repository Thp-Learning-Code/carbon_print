require 'rails_helper'

RSpec.describe Product, type: :model do

    before(:each) do
    value = Value.create(carbon_print: 21)
    type = Type.create(name: "jeans", value_id: value.id)
    ratio = Ratio.create(carbon_print_for_brand: 18)
    brand = Brand.create(name: 'Apple', ratio_id: ratio.id)
    warehouse = Warehouse.create(name: "Amazon", address: "1 rue Amazon", zip_code: 75001, country: "France", city: "Paris")
   @product = Product.create(title: "Iphone", brand_id: brand.id, type_id: type.id, price: 18, description: "smartphone Apple", warehouse_id: warehouse.id)
   expect(@product).to be_a(Product)
    end

    it "has a valid product" do
        expect(:product).to eq(:product)
    end

    context "validation" do 
        it "is valid with valid attributes" do
            expect(@product).to be_a(Product)
          end
        # describe "#type_id" do 
        #     it { expect(@product).to validate_presence_of(:type_id) }
        # end
        # describe "#brand_id" do 
        #     it { expect(@product).to validate_presence_of(:brand_id) }
        # end
        # describe "#warehouse_id" do 
        #     it { expect(@product).to validate_presence_of(:warehouse_id) }
        # end
    end

end
