require "spec_helper"

describe RecipeItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/recipe_items").should route_to("recipe_items#index")
    end

    it "routes to #new" do
      get("/recipe_items/new").should route_to("recipe_items#new")
    end

    it "routes to #show" do
      get("/recipe_items/1").should route_to("recipe_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recipe_items/1/edit").should route_to("recipe_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recipe_items").should route_to("recipe_items#create")
    end

    it "routes to #update" do
      put("/recipe_items/1").should route_to("recipe_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recipe_items/1").should route_to("recipe_items#destroy", :id => "1")
    end

  end
end
