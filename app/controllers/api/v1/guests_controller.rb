module Api::V1
  class GuestsController < ApplicationController
    
    def index
      @guests = User.select('*').where(email: nil)
      render json: @guests
    end

    def create
      @guest = User.new(user_params)

        if @guest.save
          #render json: @user, status: :created, location: @user
          render json: @guest, status: :created
        else
          render json: @guest.errors, status: :unprocessable_entity
        end
    end

    def destroy
    end
    
    private
    
    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:name, :password)
    end
  end
end