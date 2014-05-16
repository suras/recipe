require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :step_id => 1,
      :c_id => 1,
      :c_type => "MyString",
      :c_order => 1
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_step_id[name=?]", "card[step_id]"
      assert_select "input#card_c_id[name=?]", "card[c_id]"
      assert_select "input#card_c_type[name=?]", "card[c_type]"
      assert_select "input#card_c_order[name=?]", "card[c_order]"
    end
  end
end
