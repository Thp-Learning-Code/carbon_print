require 'rails_helper'

RSpec.describe "footprints/new", type: :view do
  before(:each) do
    assign(:footprint, Footprint.new())
  end

  it "renders new footprint form" do
    render

    assert_select "form[action=?][method=?]", footprints_path, "post" do
    end
  end
end
