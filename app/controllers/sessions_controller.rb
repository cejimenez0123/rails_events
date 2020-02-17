class SessionsController < ApplicationController
    def new
        @user = User.new
        
    end
    def create  
        @user = User.find_by(:email => params[:email])
        
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        elsif !@user
          
          render "new", flash: { alert: "Couldn't find user" }
        elsif !@user.authenticate(params[:password])
          
            render "new",flash: { alert: "Incorrect password"}
  
        else 
          render "new"
        end
    end
    def destroy
        session.clear
        redirect_to root_path
    end

    private 

    
end
