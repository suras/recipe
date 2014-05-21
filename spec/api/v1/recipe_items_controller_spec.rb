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
    json["name"].should eql("sand")
    json["user_id"]["$oid"].should eql(@user.id.to_s)
  end

  it 'shows a recipe items' do
    @recipe_item = FactoryGirl.create(:recipe_item)
    get "/api/v1/recipe_items/#{@recipe_item.id.to_s}"  
    expect(response).to be_success
    expect(json["_id"]['$oid']).to eq(@recipe_item.id.to_s) 
  end

  it 'updates a recipe items' do
    @recipe_item = FactoryGirl.create(:recipe_item)
    params = {:recipe_item => {:name => "updated"}}
    patch "/api/v1/recipe_items/#{@recipe_item.id.to_s}", params, :authorization => @authorization  
    expect(response).to be_success
    expect(json["name"]).to eq("updated") 
  end

  it 'delete a recipe items' do
    @recipe_item = FactoryGirl.create(:recipe_item)
    expect {
      delete "/api/v1/recipe_items/#{@recipe_item.id.to_s}", {}, :authorization => @authorization  
     }.to change(RecipeItem, :count).by(-1)
     expect(response).to be_success
  end

end