class MappedValuesController < ApplicationController
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
end
