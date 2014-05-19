class Api::V1::IngredientsController < Api::V1::BaseController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /ingredients/1.json
  def show
    render json: @ingredient
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render json: @ingredient
    else
      render json: @ingredient.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # PATCH/PUT /ingredients/1.json
  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    render json: { head :no_content }
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /ingredient_search
  def ingredients_search
    render json: Ingredient.search(params[:q])
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :ext_image_url, :image)
    end
end
