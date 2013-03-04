class Api::RandomMappedValueController < Api::BaseApiController
  before_filter :ensure_tag_parameter

  def index
    if mapped_values
      render json: mapped_values.sample
    else
      render json: {}
    end
  end

  private 
  def ensure_tag_parameter
    unless request.params[:tag]
      render json: {error: "You are missing a parameter: 'tag'"}, status: 400
    end
  end

  def tag
    @tag ||= Tag.find_by_name(params[:tag])
  end

  def mapped_values
    if tag && tag.mapped_values.length > 0
      @mapped_values ||= tag.mapped_values
    end
  end
end
