class UsersController < ApplicationController
    before_action :find_user, except: [:new,:create]
    before_action :login_check, only: [:show,:edit,:destroy]
    def new
        @user = User.new
    end
    def create

        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
        
            redirect_to sign_up_path
        end
    end
    def destroy
    end
    def edit
    end
    def show
        
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end
    def find_user
        @user = User.find(params[:id])
    end
end
