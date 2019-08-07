class UsersController < ApplicationController
  def new
  end

  def show
		@books = Book.where(user_id: params[:id])
  end

  def edit
  end

  def index
		@users = User.all.order(name: "DESC")
  end
end
