class UsersController < ApplicationController

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
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def index
    @users = User.all.order(name: "DESC")
    @user = current_user
    @newbook = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
