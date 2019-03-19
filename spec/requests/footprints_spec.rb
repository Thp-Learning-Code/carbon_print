require 'rails_helper'

RSpec.describe "Footprints", type: :request do
  describe "GET /footprints" do
    it "works! (now write some real specs)" do
      get footprints_path
      expect(response).to have_http_status(200)
    end
  end
end
