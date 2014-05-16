require "spec_helper"

describe WorkflowsController do
  describe "routing" do

    it "routes to #index" do
      get("/workflows").should route_to("workflows#index")
    end

    it "routes to #new" do
      get("/workflows/new").should route_to("workflows#new")
    end

    it "routes to #show" do
      get("/workflows/1").should route_to("workflows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workflows/1/edit").should route_to("workflows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workflows").should route_to("workflows#create")
    end

    it "routes to #update" do
      put("/workflows/1").should route_to("workflows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workflows/1").should route_to("workflows#destroy", :id => "1")
    end

  end
end
