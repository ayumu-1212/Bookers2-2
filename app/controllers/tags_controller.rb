class TagsController < ApplicationController
  before_action :set_book

  def index
    @user = current_user
    @tag_contents = TagContent.all
  end

  def show
    @taged = Tag.find(params[:id])
    book = Book.find(@taged.book_id)
    @user = User.find(book.user_id)
  end

  private
  def set_book
    @newbook = Book.new
    @tag = @newbook.tags.build
    @private_description = @tag.private_descriptions.build
    @newtag = TagContent.new
    @public_description = @newtag.public_descriptions.build
  end
end
