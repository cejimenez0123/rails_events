module ApplicationHelper
    def current_user
        @current_user||=User.find(session[:user_id])
    end
    def logged_in?
        !!session[:user_id]
    end
    def login_check
        if logged_in?
            nil
        else
            redirect_to root_path
        end
    end
   
end
