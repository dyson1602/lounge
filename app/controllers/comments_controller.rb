class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      # redirect_to post_path()
    else
      flash[:errors] = @comment.errors.full_messages
      # add in later
    end
  end

  def edit

  end

  def update
    if @comment(comment_params)
      # add later
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def destroy
    @comment.destroy
    # redirect_to Something_path
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :user_comment)
  end
end