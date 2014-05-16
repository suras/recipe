require 'spec_helper'

describe "workflows/index" do
  before(:each) do
    assign(:workflows, [
      stub_model(Workflow,
        :name => "Name",
        :ext_image_url => "Ext Image Url",
        :image => "Image"
      ),
      stub_model(Workflow,
        :name => "Name",
        :ext_image_url => "Ext Image Url",
        :image => "Image"
      )
    ])
  end

  it "renders a list of workflows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ext Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
