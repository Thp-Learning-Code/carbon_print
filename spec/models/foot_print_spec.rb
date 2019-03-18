require 'rails_helper'

RSpec.describe FootPrint, type: :model do
    it "should create a product foot_print"  do
      user =  User.create(first_name: 'bob', last_name: 'lenon', zip_code: 75000, town: 'Butte chaumont', email: "test@gmail.com", password: 123456)
      value = Value.create(carbon_print: 21)
      type = Type.create(name: "jeans", value_id: value.id)
      ratio = Ratio.create(carbon_print_for_brand: 18)
      brand = Brand.create(name: 'Apple', ratio_id: ratio.id)
      product = Product.create(title: "Iphone", brand_id: brand.id, type_id: type.id, price: 18, description: "smartphone Apple")
      FootPrint.create(delivery_address: "17 avenue simon bolivar", zip_code: 75019, user_id: user.id, product_id: product.id)
      expect(FootPrint.count).to eq(1)
    end
end
