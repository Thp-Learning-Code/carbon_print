require 'rails_helper'

RSpec.describe "footprints/index", type: :view do
  before(:each) do
    assign(:footprints, [
      Footprint.create!(),
      Footprint.create!()
    ])
  end

  it "renders a list of footprints" do
    render
  end
end
