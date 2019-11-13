module Api::V1
  class ScoresController < ApplicationController
    

    def index
      if params[:juego] == "1"
        @scores = Score.select('DISTINCT ON (scores.user_id) scores.*').order('scores.user_id, scores.value DESC')
      end
      if params[:juego] == "2"
        @scores = WaterScore.select('DISTINCT ON (water_scores.user_id) water_scores.*').order('water_scores.user_id, water_scores.value DESC')
      end
      render json: @scores
    end

    def show
      if params[:juego] == "1"
        @score = Score.find(params[:id])
      end
      if params[:juego] == "2"
        @score = WaterScore.find(params[:id])
      end
      render json: @score
    end
 
  end
end