require 'spec_helper'

describe "steps/new" do
  before(:each) do
    assign(:step, stub_model(Step,
      :recipe_item_id => 1,
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", steps_path, "post" do
      assert_select "input#step_recipe_item_id[name=?]", "step[recipe_item_id]"
      assert_select "input#step_comment[name=?]", "step[comment]"
    end
  end
end
