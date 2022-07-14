class UsersController < ApplicationController
  before_action :set_user

  def index
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
