require 'spec_helper'

   before(:each) do
    @user = FactoryGirl.create(:user)  
    http_login(@user.authentication_token, @user.email)
  end
  
  describe "Recipe Items API", :type => :api do
    it 'creates a recipe item' do
      params = {:recipe_item => {:name => "sand"}}
      # format: :json {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      post "/api/v1/recipe_items", params
      expect(response).to be_success
      recipe = JSON.parse(response.body)
      json["name"].should eql("sand")
    end

end