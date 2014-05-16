require 'spec_helper'

describe "ingredients/new" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :name => "MyString",
      :ext_image_url => "MyString",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredients_path, "post" do
      assert_select "input#ingredient_name[name=?]", "ingredient[name]"
      assert_select "input#ingredient_ext_image_url[name=?]", "ingredient[ext_image_url]"
      assert_select "input#ingredient_image[name=?]", "ingredient[image]"
    end
  end
end
