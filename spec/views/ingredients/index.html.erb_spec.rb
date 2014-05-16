require 'spec_helper'

describe "ingredients/index" do
  before(:each) do
    assign(:ingredients, [
      stub_model(Ingredient,
        :name => "Name",
        :ext_image_url => "Ext Image Url",
        :image => "Image"
      ),
      stub_model(Ingredient,
        :name => "Name",
        :ext_image_url => "Ext Image Url",
        :image => "Image"
      )
    ])
  end

  it "renders a list of ingredients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ext Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
