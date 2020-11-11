class ApplicationController < ActionController::Base

    before_action :logged_in
    before_action :authorization

    def logged_in
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorization
        redirect_to posts_path unless logged_in
    end

end
