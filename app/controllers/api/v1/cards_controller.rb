class Api::V1::CardsController < < Api::V1::BaseController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /cards.json
  def index
    @cards = Card.all
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # GET /cards/1.json
  def show
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # POST /cards.json
  def create
    @card = Card.new(card_params)
    if @card.save
      render json: @card
    else
      render json: @card.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # PATCH/PUT /cards/1.json
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors
    end
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  # DELETE /cards/1.json
  def destroy
    @card.destroy
    json: { head :no_content }
  rescue => e
     render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:step_id, :c_id, :c_type, :c_order)
    end
end
