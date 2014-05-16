require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RecipeItemsController do

  # This should return the minimal set of attributes required to create a valid
  # RecipeItem. As you add validations to RecipeItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecipeItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all recipe_items as @recipe_items" do
      recipe_item = RecipeItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:recipe_items).should eq([recipe_item])
    end
  end

  describe "GET show" do
    it "assigns the requested recipe_item as @recipe_item" do
      recipe_item = RecipeItem.create! valid_attributes
      get :show, {:id => recipe_item.to_param}, valid_session
      assigns(:recipe_item).should eq(recipe_item)
    end
  end

  describe "GET new" do
    it "assigns a new recipe_item as @recipe_item" do
      get :new, {}, valid_session
      assigns(:recipe_item).should be_a_new(RecipeItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipe_item as @recipe_item" do
      recipe_item = RecipeItem.create! valid_attributes
      get :edit, {:id => recipe_item.to_param}, valid_session
      assigns(:recipe_item).should eq(recipe_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RecipeItem" do
        expect {
          post :create, {:recipe_item => valid_attributes}, valid_session
        }.to change(RecipeItem, :count).by(1)
      end

      it "assigns a newly created recipe_item as @recipe_item" do
        post :create, {:recipe_item => valid_attributes}, valid_session
        assigns(:recipe_item).should be_a(RecipeItem)
        assigns(:recipe_item).should be_persisted
      end

      it "redirects to the created recipe_item" do
        post :create, {:recipe_item => valid_attributes}, valid_session
        response.should redirect_to(RecipeItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipe_item as @recipe_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        RecipeItem.any_instance.stub(:save).and_return(false)
        post :create, {:recipe_item => { "user_id" => "invalid value" }}, valid_session
        assigns(:recipe_item).should be_a_new(RecipeItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RecipeItem.any_instance.stub(:save).and_return(false)
        post :create, {:recipe_item => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested recipe_item" do
        recipe_item = RecipeItem.create! valid_attributes
        # Assuming there are no other recipe_items in the database, this
        # specifies that the RecipeItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RecipeItem.any_instance.should_receive(:update).with({ "user_id" => "MyString" })
        put :update, {:id => recipe_item.to_param, :recipe_item => { "user_id" => "MyString" }}, valid_session
      end

      it "assigns the requested recipe_item as @recipe_item" do
        recipe_item = RecipeItem.create! valid_attributes
        put :update, {:id => recipe_item.to_param, :recipe_item => valid_attributes}, valid_session
        assigns(:recipe_item).should eq(recipe_item)
      end

      it "redirects to the recipe_item" do
        recipe_item = RecipeItem.create! valid_attributes
        put :update, {:id => recipe_item.to_param, :recipe_item => valid_attributes}, valid_session
        response.should redirect_to(recipe_item)
      end
    end

    describe "with invalid params" do
      it "assigns the recipe_item as @recipe_item" do
        recipe_item = RecipeItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RecipeItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => recipe_item.to_param, :recipe_item => { "user_id" => "invalid value" }}, valid_session
        assigns(:recipe_item).should eq(recipe_item)
      end

      it "re-renders the 'edit' template" do
        recipe_item = RecipeItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RecipeItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => recipe_item.to_param, :recipe_item => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recipe_item" do
      recipe_item = RecipeItem.create! valid_attributes
      expect {
        delete :destroy, {:id => recipe_item.to_param}, valid_session
      }.to change(RecipeItem, :count).by(-1)
    end

    it "redirects to the recipe_items list" do
      recipe_item = RecipeItem.create! valid_attributes
      delete :destroy, {:id => recipe_item.to_param}, valid_session
      response.should redirect_to(recipe_items_url)
    end
  end

end