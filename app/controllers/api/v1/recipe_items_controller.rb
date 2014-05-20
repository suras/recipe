class Api::V1::RecipeItemsController < Api::V1::BaseController
  before_action :set_recipe_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /recipe_items.json
  def index
    @recipe_items = RecipeItem.all
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /recipe_items/1.json
  def show
    render json: @recipe_item
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # POST /recipe_items.json
  def create
    @recipe_item = current_user.recipe_items.new(recipe_item_params)
    if @recipe_item.save
      render json: @recipe_item
    else
      render json: @recipe_item.errors
    end
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # PATCH/PUT /recipe_items/1.json
  def update
    if @recipe_item.update(recipe_item_params)
      render json: @recipe_item
    else
      render json: @recipe_item.errors
    end
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # DELETE /recipe_items/1.json
  def destroy
    @recipe_item.destroy
    render json: { head: :no_content }
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_item
      @recipe_item = RecipeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_item_params
      params.require(:recipe_item).permit(:user_id, :name)
    end
end
