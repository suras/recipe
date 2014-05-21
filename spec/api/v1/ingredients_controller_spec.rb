require 'spec_helper'

describe "Ingredients API", :type => :api do
  
  it 'creates an ingredient' do
    @user = FactoryGirl.create(:user)  
    @authorization = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token ,{:email => @user.email})
    params = { ingredient: {name: "sand"}}
    post "/api/v1/ingredients", params, authorization: @authorization
    expect(response).to be_success
    json["name"].should eql("sand")
  end

  it 'search for ingredients' do
    @ingredient = FactoryGirl.create(:ingredient)  
    get "/api/v1/ingredients_search", {q: @ingredient.name}
    expect(response).to be_success
    json[0]["name"].should eql(@ingredient.name)
  end

 
end
