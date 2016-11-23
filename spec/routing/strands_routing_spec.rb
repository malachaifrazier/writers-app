require "rails_helper"

RSpec.describe StrandsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/strands").to route_to("strands#index")
    end

    it "routes to #new" do
      expect(:get => "/strands/new").to route_to("strands#new")
    end

    it "routes to #show" do
      expect(:get => "/strands/1").to route_to("strands#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/strands/1/edit").to route_to("strands#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/strands").to route_to("strands#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/strands/1").to route_to("strands#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/strands/1").to route_to("strands#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/strands/1").to route_to("strands#destroy", :id => "1")
    end

  end
end
