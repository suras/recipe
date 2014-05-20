require 'spec_helper'

describe "Recipe Items API", :type => :api do

  before(:each) do
    @user = FactoryGirl.create(:user)  
    @authorization = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token ,{:email => @user.email})
  end
  
  it 'creates a recipe item' do
    params = {:recipe_item => {:name => "sand"}}
    # format: :json {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
    post "/api/v1/recipe_items", params, :authorization => @authorization
    expect(response).to be_success
    recipe = JSON.parse(response.body)
    json["name"].should eql("sand")
    json["user_id"]["$oid"].should eql(@user.id.to_s)
  end

end