require "rails_helper"

RSpec.describe FootPrintsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/foot_prints").to route_to("foot_prints#index")
    end

    it "routes to #new" do
      expect(:get => "/foot_prints/new").to route_to("foot_prints#new")
    end

    it "routes to #show" do
      expect(:get => "/foot_prints/1").to route_to("foot_prints#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/foot_prints/1/edit").to route_to("foot_prints#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/foot_prints").to route_to("foot_prints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/foot_prints/1").to route_to("foot_prints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/foot_prints/1").to route_to("foot_prints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/foot_prints/1").to route_to("foot_prints#destroy", :id => "1")
    end
  end
end
