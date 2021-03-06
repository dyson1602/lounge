class SessionsController < ApplicationController
    skip_before_action :authorization, only: [:new, :create, :index]

    def logout
        # byebug
        session.delete(:user_id)
        redirect_to login_path
    end

    def index
    end

    def new
    end

    def create
        user = User.find_by(user_name: params[:session][:user_name])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to posts_path
        else
            flash[:error] = "Username or password is incorrect."
            redirect_to new_login_path
        end
    end

end #SessionsController