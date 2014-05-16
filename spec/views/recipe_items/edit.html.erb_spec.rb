require 'spec_helper'

describe "recipe_items/edit" do
  before(:each) do
    @recipe_item = assign(:recipe_item, stub_model(RecipeItem,
      :user_id => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit recipe_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipe_item_path(@recipe_item), "post" do
      assert_select "input#recipe_item_user_id[name=?]", "recipe_item[user_id]"
      assert_select "input#recipe_item_name[name=?]", "recipe_item[name]"
    end
  end
end
