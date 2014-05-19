class Api::V1::StepsController < Api::V1::BaseController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe

  # GET /steps.json
  def index
    @steps = Step.all
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /steps/1.json
  def show
    render json: @step
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # POST /steps.json
  def create
    @step = @recipe_item.steps.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors
    end
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # PATCH/PUT /steps/1.json
  def update
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors
    end
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # DELETE /steps/1.json
  def destroy
    @step.destroy
    render json: { head: :no_content }
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    def set_recipe
      @recipe_item = RecipeItem.find(params[:recipe_item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:recipe_item_id, :comment, cards: [:c_type, :c_id, :c_varient]
)
    end
end
