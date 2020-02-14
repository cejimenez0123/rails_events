class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create  
        @user = User.find_by(:email => params[:email])
    
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          session[:login_error] = nil
          redirect_to user_path(@user)
        else 
          redirect log_in_path
        end
    end
    def destroy
        session.clear
        redirect_to root_path
    end

    private 

    
end
