require 'rails_helper'

RSpec.describe Product, type: :model do
 it "should create a product" do 
    Value.create(carbon_print: 21)
    Type.create(name: "jeans", value_id: 2)
    Ratio.create(carbon_print_for_brand: 18)
    Brand.create(name: 'Apple', ratio_id: 1)
    Product.create(title: "Iphone", brand_id: 1, type_id: 1, price: 18, description: "smartphone Apple")
    expect(Product.count).to eq(1)
 end
end
