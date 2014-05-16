require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :step_id => 1,
        :c_id => 2,
        :c_type => "C Type",
        :c_order => 3
      ),
      stub_model(Card,
        :step_id => 1,
        :c_id => 2,
        :c_type => "C Type",
        :c_order => 3
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "C Type".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
