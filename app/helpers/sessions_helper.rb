module SessionsHelper
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def authenticate_user!
      unless logged_in?
        redirect_to login_path, alert: "Please log in first"
      end
    end
  end
  