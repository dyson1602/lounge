class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorization, only: [:index]

  def index
    @posts = Post.all
    @imgs = [
      "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3150&q=80",
      "https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3172&q=80",
      "https://images.unsplash.com/photo-1581466046946-06ea1cdcda9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3150&q=80",
      "https://images.unsplash.com/photo-1577632585381-c50d2d100116?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3150&q=80",
      "https://images.unsplash.com/photo-1563813318650-1e23051cf43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3150&q=80",
      "https://images.unsplash.com/photo-1547269174-c16503aab218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3150&q=80"
    ]
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
