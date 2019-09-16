class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :who_are_you, only: [:edit, :update]

  def following_index
    @user = User.find(params[:id])
  end

  def follower_index
    @user = User.find(params[:id])
  end

  def show
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.all.order(name: "DESC")
    @user = current_user
    @newbook = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def who_are_you
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end
end
