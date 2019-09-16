class BookCommentsController < ApplicationController
  before_action :who_are_you, only: [:edit, :update, :destroy]
  def edit
    @comment = BookComment.find(params[:id])
    @book = @comment.book
  end
  def create
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = params[:book_id].to_i
    if @comment.save!
      flash[:notice] = "You have created book's comment successfully."
      redirect_to book_path(@comment.book_id)
    else
      @book = Book.find(params[:id])
      @user = @book.user
      @newbook = Book.new
      @comments = BookComment.all
      render book_path(@comment.book_id)
    end
  end

  def update
    @comment = BookComment.find(params[:id])
    if @comment.update(book_comment_params)
      flash[:notice] = "You have updated book's comment successfully."
      redirect_to book_path(@comment.book_id)
    else
      @book = Book.find(params[:id])
      @user = @book.user
      @newbook = Book.new
      @comments = BookComment.all
      render book_path(@comment.book_id)
    end
  end

  def destroy
    comment = BookComment.find(params[:id])
    book = Book.find(comment.book_id)
    comment.destroy
    redirect_to book_path(book)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def who_are_you
    if current_user.id != BookComment.find(params[:id]).user_id
      redirect_to user_path(current_user)
    end
  end
end
