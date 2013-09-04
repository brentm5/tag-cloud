class Api::RandomMappedValueController < Api::BaseApiController
  before_filter :ensure_tag_parameter

  def index
    if random_mapped_value
      render json: random_mapped_value
      increment_return_count
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

  def increment_return_count
    if random_mapped_value
      random_mapped_value.return_count += 1
      random_mapped_value.save
    end
  end

  def random_mapped_value
    if mapped_values
      @random_mapped_value ||= mapped_values.sample
    end
  end

  def mapped_values
    if tag && tag.mapped_values.length > 0
      @mapped_values ||= tag.mapped_values
    end
  end
end
