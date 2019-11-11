module Api::V1
  class ScoresController < ApplicationController
    before_action :set_user, only: [:create, :index, :show, :update, :destroy]
    before_action :set_score, only: [:show, :update, :destroy]

    # GET /scores
    def index
      @scores = @user.scores.all

      render json: @scores
    end

    # GET /scores/1
    def show
      render json: @score
    end

    # POST /scores
    def create
      
      @score = @user.scores.new(score_params)

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
        @score = @user.scores.find(params[:id])
      end

      def set_user
        @user = User.find(params[:user_id])
        set_score    
      end

      # Only allow a trusted parameter "white list" through.
      def score_params
        params.require(:score).permit(:ordinario, :peligroso, :papel,
           :plastico, :bombillo, :pila, :value)
      end
  end
end