class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    my_posts
  end

  def my_posts
    if user_signed_in?
      @my_posts = @user.current_user
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
