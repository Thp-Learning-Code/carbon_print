require 'rails_helper'

RSpec.describe "footprints/show", type: :view do
  before(:each) do
    @footprint = assign(:footprint, Footprint.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
