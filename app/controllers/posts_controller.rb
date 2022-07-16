class PostsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to posts_path
  end

  def show
  end

  def edit
    @post.user = current_user
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def my_posts
    @my_posts = current_user.posts
  end

  def destroy
    @post.destroy
    redirect_to my_posts_path(current_user)
  end

  def home
    if user_signed_in?
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:orginal_url, :title, :image, :note)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
