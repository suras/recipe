class Api::V1::WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /workflows.json
  def index
    @workflows = Workflow.all
    render json: @workflows
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /workflows/1.json
  def show
    render json: @workflow
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # POST /workflows.json
  def create
    @workflow = Workflow.new(workflow_params)
    if @workflow.save
      render json: @workflow 
    else
      render json: @workflow.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # PATCH/PUT /workflows/1.json
  def update
    if @workflow.update(workflow_params)
      render json: @workflow
    else
      render json: @workflow.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # DELETE /workflows/1.json
  def destroy
    @workflow.destroy
    render json: { head :no_content }
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end


  # GET /workflow_search
  def workflows_search
    render json: Workflow.search(params[:q])
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_params
      params.require(:workflow).permit(:name, :ext_image_url, :image)
    end
end
