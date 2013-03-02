class TagsController < ApplicationController
  def index
    @tags = Tag.limit(100).all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params.require(:tag).permit(:name))
    if @tag.save
      flash[:notice] = "Added tag #{@tag.name}"
      redirect_to tags_path
    else
      render 'new'
    end
  end
end
