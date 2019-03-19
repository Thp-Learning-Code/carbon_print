require 'rails_helper'

RSpec.describe Product, type: :model do

    before(:each) do
        @type = FactoryBot.create(:type)
        @product = FactoryBot.create(:product)
    end
    it "has a valid factory" do
        # teste toujours tes factories pour voir si elles sont valides
        expect(build(:product)).to be_valid
    end

end


# it "should create a product" do 
#     value = Value.create(carbon_print: 21)
#     type = Type.create(name: "jeans", value_id: value.id)
#     ratio = Ratio.create(carbon_print_for_brand: 18)
#     brand = Brand.create(name: 'Apple', ratio_id: ratio.id)
#     Product.create(title: "Iphone", brand_id: brand.id, type_id: type.id, price: 18, description: "smartphone Apple")
#     expect(Product.count).to eq(1)
#  end