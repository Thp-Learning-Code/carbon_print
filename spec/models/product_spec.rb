require 'rails_helper'

RSpec.describe Product, type: :model do
 it "should create a product" do 
    Product.create(title: "Iphone", price: 18.5, description: "smartphone Apple")
    expect(Product.count).to eq(1)
 end
end
