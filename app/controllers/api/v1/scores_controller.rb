module Api::V1
  class ScoresController < ApplicationController
    

    def index
      if params[:juego] == "1"
        @scores = User.joins(:scores).select('DISTINCT ON (scores.user_id) users.name,scores.*')
        .order('scores.user_id',value: :desc)
        .sort_by{
          |row| row[:value]
        }.reverse
        
        #@scores = User.joins(:scores).select('MAX(scores.value) as value, users.id').group(:id).order('value DESC')
      end
      if params[:juego] == "2"
        @scores = User.joins(:water_scores)
        .select('DISTINCT ON (water_scores.user_id) users.name, water_scores.*')
        .order('water_scores.user_id, water_scores.value DESC')
        .sort_by{|row| row[:value]}.reverse
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