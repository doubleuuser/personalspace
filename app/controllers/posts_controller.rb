require 'metainspector'
require 'open-uri'

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

    page_url = @post.original_url
    puts page_url
    page = MetaInspector.new(page_url)
    puts @post.title = page.best_title
    puts @post.original_author = page.best_author
    puts @post.description = page.best_description
    puts @post.image = page.images.best


    # html = URI.open(page_url)
    # doc = Nokogiri::HTML(html)
    # puts doc.meta_encoding
    # if doc.css('title') != ""
    #   @post.title = doc.css('title')
    #   puts @post.title
    # elsif doc.css('meta') != ""
    #   @post.title = doc.css('meta')
    #   puts @post.title
    # end
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
    params.require(:post).permit(:original_url, :image, :note)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
