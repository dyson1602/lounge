class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end

  def create
    # byebug
    @comment = Comment.create(comment_params)
    if @comment.valid?
      PostComment.new(comment_id: @comment.id, post_id: flash[:post_id][0])
      redirect_to post_path(flash[:post_id][0])
    else
      flash[:errors] = @comment.errors.full_messages
      # add in later
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
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