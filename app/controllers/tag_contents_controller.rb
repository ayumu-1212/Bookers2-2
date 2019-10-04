class TagContentsController < ApplicationController
  def create
    @newtag = TagContent.new(tag_content_params)
    if @newtag.save
      flash[:notice] = "You can make a tag!"
      redirect_to "#{params[:tag_content][:pass]}"
    else
      @books = Book.all.order(:created_at)
      @user = current_user
      @newbook = Book.new
      @tag = @newbook.tags.build
      @private_description = @tag.private_descriptions.build
      render "books/index"
    end
  end
  def edit
    @tag_content = TagContent.find(params[:id])
  end

  def update
    @tag_content = TagContent.find(params[:id])
    if @tag_content.update(tag_content_params)
      flash[:notice] = "You can update!"
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    tag_content = TagContent.find(params[:id])
    tag_content.destroy
    redirect_to tags_path
  end

  private
  def tag_content_params
    params.require(:tag_content).permit(:genre, public_descriptions_attributes: [:id, :content, :_destroy])
  end
end
