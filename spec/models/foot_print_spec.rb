require 'rails_helper'

RSpec.describe FootPrint, type: :model do
    it "should create a product foot_print"  do
      FootPrint.create(delivery_address: "17 avenue simon bolivar", zip_code: 75019, user_id: 1, product_id: 1)
      expect(FootPrint.count).to eq(1)
    end
end
