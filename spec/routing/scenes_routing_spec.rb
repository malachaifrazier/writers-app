require "rails_helper"

RSpec.describe ScenesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scenes").to route_to("scenes#index")
    end

    it "routes to #new" do
      expect(:get => "/scenes/new").to route_to("scenes#new")
    end

    it "routes to #show" do
      expect(:get => "/scenes/1").to route_to("scenes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scenes/1/edit").to route_to("scenes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scenes").to route_to("scenes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scenes/1").to route_to("scenes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scenes/1").to route_to("scenes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scenes/1").to route_to("scenes#destroy", :id => "1")
    end

  end
end
