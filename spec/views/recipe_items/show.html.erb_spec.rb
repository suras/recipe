require 'spec_helper'

describe "recipe_items/show" do
  before(:each) do
    @recipe_item = assign(:recipe_item, stub_model(RecipeItem,
      :user_id => "User",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Name/)
  end
end
