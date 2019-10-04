class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :who_are_you, only: [:edit, :update]
  before_action :set_book, only: [:index, :show]
  before_action :set_user, only: [:update, :edit, :show, :following_index, :follower_index]

  def following_index
  end

  def follower_index
  end

  def show
    @books = Book.where(user_id: params[:id])
  end

  def edit
  end

  def update
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_book
    @newbook = Book.new
    @tag = @newbook.tags.build
    @private_description = @tag.private_descriptions.build
    @newtag = TagContent.new
    @public_description = @newtag.public_descriptions.build
  end

  def who_are_you
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

end
