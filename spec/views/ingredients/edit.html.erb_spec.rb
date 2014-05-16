require 'spec_helper'

describe "ingredients/edit" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :name => "MyString",
      :ext_image_url => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do
      assert_select "input#ingredient_name[name=?]", "ingredient[name]"
      assert_select "input#ingredient_ext_image_url[name=?]", "ingredient[ext_image_url]"
      assert_select "input#ingredient_image[name=?]", "ingredient[image]"
    end
  end
end
