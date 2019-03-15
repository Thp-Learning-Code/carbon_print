require 'rails_helper'

RSpec.describe "foot_prints/new", type: :view do
  before(:each) do
    assign(:foot_print, FootPrint.new(
      :delivery_address => "MyString",
      :zip_code => 1,
      :town => "MyString",
      :country => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :result => "9.99",
      :user_id => "",
      :product_id => ""
    ))
  end

  it "renders new foot_print form" do
    render

    assert_select "form[action=?][method=?]", foot_prints_path, "post" do

      assert_select "input[name=?]", "foot_print[delivery_address]"

      assert_select "input[name=?]", "foot_print[zip_code]"

      assert_select "input[name=?]", "foot_print[town]"

      assert_select "input[name=?]", "foot_print[country]"

      assert_select "input[name=?]", "foot_print[latitude]"

      assert_select "input[name=?]", "foot_print[longitude]"

      assert_select "input[name=?]", "foot_print[result]"

      assert_select "input[name=?]", "foot_print[user_id]"

      assert_select "input[name=?]", "foot_print[product_id]"
    end
  end
end
