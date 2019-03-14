require 'rails_helper'

RSpec.describe "foot_prints/show", type: :view do
  before(:each) do
    @foot_print = assign(:foot_print, FootPrint.create!(
      :delivery_address => "Delivery Address",
      :zip_code => 2,
      :town => "Town",
      :country => "Country",
      :latitude => 3.5,
      :longitude => 4.5,
      :result => "9.99",
      :user_id => "",
      :product_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Delivery Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Town/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
