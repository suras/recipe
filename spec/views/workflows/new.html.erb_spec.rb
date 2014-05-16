require 'spec_helper'

describe "workflows/new" do
  before(:each) do
    assign(:workflow, stub_model(Workflow,
      :name => "MyString",
      :ext_image_url => "MyString",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new workflow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", workflows_path, "post" do
      assert_select "input#workflow_name[name=?]", "workflow[name]"
      assert_select "input#workflow_ext_image_url[name=?]", "workflow[ext_image_url]"
      assert_select "input#workflow_image[name=?]", "workflow[image]"
    end
  end
end
