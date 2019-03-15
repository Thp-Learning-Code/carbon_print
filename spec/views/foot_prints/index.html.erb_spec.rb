require 'rails_helper'

RSpec.describe "foot_prints/index", type: :view do
  before(:each) do
    assign(:foot_prints, [
      FootPrint.create!(
        :delivery_address => "Delivery Address",
        :zip_code => 2,
        :town => "Town",
        :country => "Country",
        :latitude => 3.5,
        :longitude => 4.5,
        :result => "9.99",
        :user_id => "",
        :product_id => ""
      ),
      FootPrint.create!(
        :delivery_address => "Delivery Address",
        :zip_code => 2,
        :town => "Town",
        :country => "Country",
        :latitude => 3.5,
        :longitude => 4.5,
        :result => "9.99",
        :user_id => "",
        :product_id => ""
      )
    ])
  end

  it "renders a list of foot_prints" do
    render
    assert_select "tr>td", :text => "Delivery Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Town".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
