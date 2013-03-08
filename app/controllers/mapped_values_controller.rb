class MappedValuesController < ApplicationController
  before_filter :authorize_user
  def new
    @mapped_value = MappedValue.new
  end

  def create
    @mapped_value = MappedValue.new(params.require(:mapped_value).permit(:value, :tag_id))
    if @mapped_value.save
      flash[:notice] = "You have added a new value for #{@mapped_value.tag.name}"
      redirect_to new_mapped_value_path
    else
      render 'new'
    end
  end

  def destroy
    mapped_value = MappedValue.find_by_id(params[:id])
    tag = mapped_value.tag

    mapped_value.destroy

    flash[:notice] = 'Successfully deleted value'
    redirect_to tag_path(tag)
  end
end
