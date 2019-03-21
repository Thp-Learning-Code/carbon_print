require 'rails_helper'

RSpec.describe "footprints/edit", type: :view do
  before(:each) do
    @footprint = assign(:footprint, Footprint.create!())
  end

  it "renders the edit footprint form" do
    render

    assert_select "form[action=?][method=?]", footprint_path(@footprint), "post" do
    end
  end
end
