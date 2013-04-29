class TagsController < ApplicationController
  before_filter :authorize_user

  def index
    @tags = Tag.limit(100).all
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find_by_id(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Added tag #{@tag.name}"
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def update
    @tag = Tag.find_by_id(params[:id])
    if @tag.update_attributes(tag_params)
      flash[:notice] = 'Updated Tag'
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def show
    @tag = Tag.find_by_id(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :description)
  end
end
