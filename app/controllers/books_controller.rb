class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :who_are_you, only: [:edit, :update, :destroy]
  before_action :set_book, only: [:index, :show]

  def index
    @books = Book.all.order(:created_at)
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @comment = BookComment.new
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
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@newbook)
    else
      @user = current_user
      @books = Book.all.order(:created_at)
      @newtag = TagContent.new
      @public_description = @newtag.public_descriptions.build
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, tags_attributes: [:id, :tag_content_id, :_destroy, private_descriptions_attributes: [:id, :content, :_destroy]])
  end

  def set_book
    @newbook = Book.new
    @tag = @newbook.tags.build
    @private_description = @tag.private_descriptions.build
    @newtag = TagContent.new
    @public_description = @newtag.public_descriptions.build
  end

  def who_are_you
    if current_user != Book.find(params[:id]).user
      redirect_to books_path
    end
  end
end
