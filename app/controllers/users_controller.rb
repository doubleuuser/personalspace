require 'friendly_id'

class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy, :unfollow, :follow]
  skip_before_action :authenticate_user!, only: [ :home, :index, :show ]


  def index
    posts
  end

  def show
  end

  def my_posts
    if user_signed_in?
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  def follow
    if current_user == @user
      flash[:error] = "You cannot follow yourself."
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following #{@user.username}"
    end
    redirect_to user_path(@user)
  end

  def unfollow
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.username}."
    else
      flash[:error] = "You must be logged in to unfollow #{@user.username}."
    end
    redirect_to user_path(@user)
  end


  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
