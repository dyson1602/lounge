class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorization, only: [:index]

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(@post.user_id)
    @url = @post.content_url
    @comment = Comment.new
    @comments = @post.comments
    # byebug
  end

  def new
    @post = Post.new
    @categories = ["Articles", "Videos"]
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @categories = ["Articles", "Videos"]
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def destroy
    id = @post.user_id
    @post.destroy
    redirect_to user_path(id)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content_url, :category, :title)
  end
end
