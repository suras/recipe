require 'spec_helper'

describe "workflows/show" do
  before(:each) do
    @workflow = assign(:workflow, stub_model(Workflow,
      :name => "Name",
      :ext_image_url => "Ext Image Url",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Ext Image Url/)
    rendered.should match(/Image/)
  end
end
