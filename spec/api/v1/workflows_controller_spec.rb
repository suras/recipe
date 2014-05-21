require 'spec_helper'

describe "Workflows API", :type => :api do
  
  it 'creates a workflow' do
    @user = FactoryGirl.create(:user)  
    @authorization = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token ,{:email => @user.email})
    params = { workflow: {name: "sand"}}
    post "/api/v1/workflows", params, authorization: @authorization
    expect(response).to be_success
    json["name"].should eql("sand")
  end

  it 'search for workflows' do
    @workflow = FactoryGirl.create(:workflow)  
    get "/api/v1/workflows_search", {q: @workflow.name}
    expect(response).to be_success
    json[0]["name"].should eql(@workflow.name)
  end

 
end