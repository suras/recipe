require 'spec_helper'

describe "recipe_items/new" do
  before(:each) do
    assign(:recipe_item, stub_model(RecipeItem,
      :user_id => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new recipe_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipe_items_path, "post" do
      assert_select "input#recipe_item_user_id[name=?]", "recipe_item[user_id]"
      assert_select "input#recipe_item_name[name=?]", "recipe_item[name]"
    end
  end
end
