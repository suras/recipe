require 'spec_helper'

describe "recipe_items/index" do
  before(:each) do
    assign(:recipe_items, [
      stub_model(RecipeItem,
        :user_id => "User",
        :name => "Name"
      ),
      stub_model(RecipeItem,
        :user_id => "User",
        :name => "Name"
      )
    ])
  end

  it "renders a list of recipe_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
