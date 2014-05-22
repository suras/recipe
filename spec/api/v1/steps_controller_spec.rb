require 'spec_helper'

describe "Recipe Items API", :type => :api do

  before(:each) do
    @user = FactoryGirl.create(:user)  
    @authorization = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token ,{:email => @user.email})
  end
  
  it 'creates a step' do
    @recipe_item = FactoryGirl.create(:recipe_item)  
    params = {recipe_item_id:@recipe_item.id.to_s , step: {comment: "test comment", cards:[{c_type: "ingredient", c_id: 1, c_variant: "temperature"}]}}
    # format: :json {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
    post "/api/v1/steps", params, authorization: @authorization
    expect(response).to be_success
    json["comment"].should eql("test comment")
  end

  it 'shows a step' do
    @recipe_item = FactoryGirl.create(:recipe_item) 
    @step = @recipe_item.steps.create(comment: "test")
    get "/api/v1/steps/", {id: @step.id, recipe_item_id: @recipe_item.id}  
    expect(response).to be_success
    json["comment"].should eql(@step.comment) 
  end

  it 'updates a step' do
    @recipe_item = FactoryGirl.create(:recipe_item) 
    @step = @recipe_item.steps.create(comment: "test")
    params = {recipe_item_id:@recipe_item.id.to_s, id: @step.id, step: {comment: "updated", cards:[{c_type: "ingredient", c_id: 1, c_variant: "temperature"}]}}
    patch "/api/v1/steps/", params, authorization: @authorization  
    expect(response).to be_success
    expect(json["comment"]).to eq("updated") 
  end

  it 'deletes a step' do
    @recipe_item = FactoryGirl.create(:recipe_item) 
    @step = @recipe_item.steps.create(comment: "test")
    delete "/api/v1/steps/", {recipe_item_id: @recipe_item.id.to_s, id: @step.id }, authorization: @authorization  
    expect(RecipeItem.last.steps.first).to eq(nil)
  end

end


