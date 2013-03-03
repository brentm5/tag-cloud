class Api::RandomMappedValueController < Api::BaseApiController
  before_filter :check_parameters

  def index
    tag = Tag.find_by_name(params[:tag])
    if tag
      values = Tag.find_by_name(params[:tag]).mapped_values
      if values.length > 0
        render json: values.sample
        return
      end
    end
    render json: {}
  end

  private 
  def check_parameters
    unless request.params[:tag]
      render json: {error: "You are missing a parameter: 'tag'"}, status: 400
    end
  end
end
