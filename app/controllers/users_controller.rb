class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    # bring up a confirmation page that the User has been destroyed 
    # redirect later
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :mod, :bio, :location)
  end
end
