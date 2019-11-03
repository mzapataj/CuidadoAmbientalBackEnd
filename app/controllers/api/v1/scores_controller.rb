module Api::V1
  class ScoresController < ApplicationController
    before_action :set_score, only: [:show, :update, :destroy]

    # GET /scores
    def index
      @scores = Score.all

      render json: @scores
    end

    # GET /scores/1
    def show
      render json: @score
    end

    # POST /scores
    def create
      @score = Score.new(score_params)

      if @score.save
        puts api_v1_user_scores_url(@score)
        render json: @score, status: :created, location: api_v1_user_scores_url(@score)
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /scores/1
    def update
      if @score.update(score_params)
        render json: @score
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end

    # DELETE /scores/1
    def destroy
      @score.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_score
        @score = Score.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def score_params
        params.require(:score).permit(:cant_green_bin, :cant_red_bin, :cant_grey_bin,
           :cant_blue_bin, :cant_yellow_bin, :cant_orange_bin, :user_id )
      end
  end
end