require 'rails_helper'



RSpec.describe Product, type: :model do

    before(:each) do
    value = Value.create(carbon_print: 21)
    type = Type.create(name: "jeans", value_id: value.id)
    ratio = Ratio.create(carbon_print_for_brand: 18)
    brand = Brand.create(name: 'Apple', ratio_id: ratio.id)
   @product = Product.create(title: "Iphone", brand_id: brand.id, type_id: type.id, price: 18, description: "smartphone Apple", city: "paris", country: "France")
   expect(Product.count).to eq(1)
    end

    it "has a valid product" do
        # teste toujours tes factories pour voir si elles sont valides
        expect(:product).to eq(:product)
    end

    context "validation" do 
        it "is valid with valid attributes" do
            expect(@product).to be_a(Product)
          end
        describe "#type_id" do 
            it { expect(@product).to validate_presence_of(:type_id) }
        end
        describe "#brand_id" do 
            it { expect(@product).to validate_presence_of(:brand_id) }
        end
        describe "#city" do 
            it { expect(@product).to validate_presence_of(:city) }
        end
        describe "#country" do 
            it { expect(@product).to validate_presence_of(:country) }
        end
    end

end
