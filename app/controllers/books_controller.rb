class BooksController < ApplicationController
  def new
  end

  def index
		@books = Book.all.order(created_at: "DESC")
  end

  def show
  end

  def edit
  end
end
