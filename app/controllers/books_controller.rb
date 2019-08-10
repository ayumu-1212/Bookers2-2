class BooksController < ApplicationController

  before_action :who_are_you, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order(:created_at)
    @user = current_user
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def who_are_you
    if current_user != Book.find(params[:id]).user
      redirect_to user_path(current_user)
    end
  end
end
