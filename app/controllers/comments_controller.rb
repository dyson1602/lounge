class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end

  def create
    post_id = params[:comment][:post_id]
    byebug
    @comment = Comment.create(params.require(:comment).permit(:user_id, :user_comment))
    #When creating a comment from a post show page the create action method doesn't recognize our
    #comment_params method, so we had to put it in manually.
    if @comment
      PostComment.create(comment_id: @comment.id, post_id: post_id)
      redirect_to post_path(post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_page(post_id)
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      post = PostComment.find_by(comment: @comment).post
      redirect_to post_path(post)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def destroy
    post = PostComment.find_by(comment: @comment).post
    if @comment.destroy
      redirect_to post_path(post)
    end
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :user_comment)
  end
end