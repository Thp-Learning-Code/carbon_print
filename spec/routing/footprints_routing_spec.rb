require "rails_helper"

RSpec.describe FootprintsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/footprints").to route_to("footprints#index")
    end

    it "routes to #new" do
      expect(:get => "/footprints/new").to route_to("footprints#new")
    end

    it "routes to #show" do
      expect(:get => "/footprints/1").to route_to("footprints#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/footprints/1/edit").to route_to("footprints#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/footprints").to route_to("footprints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/footprints/1").to route_to("footprints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/footprints/1").to route_to("footprints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/footprints/1").to route_to("footprints#destroy", :id => "1")
    end
  end
end
