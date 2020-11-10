class ApplicationController < ActionController::Base

    before_action :logged_in

    def logged_in
        @current_user = User.find_by(id: session[:user_id])
    end

    def welcome
        redirect_to login_path unless session[:user_id]
    end

end
