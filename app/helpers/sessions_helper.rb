module SessionsHelper
    # Helper to log in user in session 
    def log_in(user)
        session[:user_id] = user.id
    end

    # Helper to get a current logged in user instance
    def get_current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session["user_id"])
        end
    end

    def is_logged_in?
        return !get_current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
