module Api::V1
=begin    
    class SessionsController < ApplicationController
    def new
    
    end
    def create
        puts("_#{params[:user][:email]}_#{params[:user][:password]}")
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            puts params[:user][:name]
            render json: user, status: :created
        end
    end
    def destroy
        @session[:user_id] = nil
        render json: @session
    end

    private 
        # Only allow a trusted paramet
            params[:user][:name] = "Monda"er "white list" through.
        def user_params
            params.require(:user).permit(:name, :telephone, :email, :password_digest, :password_confirmation ,:rank)
        end
    end
=end
class SessionsController < ApplicationController
    def new
    
    end

    def create
#        puts("_#{params[:user][:email]}_#{params[:user][:password]}")
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #puts params[:name]
            render json: @user, status: :created
        else
            render json: 
        end
    end

    def destroy
        @session[:user_id] = nil
        render json: @session
    end


    private 
        # Only allow a trusted parameter through.
        def user_params
            params.require(:user).permit(:email, :password)
        end
    end

end