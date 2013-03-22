class TagsController < ApplicationController
  before_filter :authorize_user

  def index
    @tags = Tag.limit(100).all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params.require(:tag).permit(:name, :description))
    if @tag.save
      flash[:notice] = "Added tag #{@tag.name}"
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def show
    @tag = Tag.find_by_id(params[:id])
  end
end
