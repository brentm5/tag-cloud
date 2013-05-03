class Api::MappedValuesController < Api::BaseApiController
  def create
    mapped_value = build_mapped_value
    if mapped_value.save
      render json: {status:"OK"}, status: 200
    else
      render json: {error: mapped_value.errors}, status: 400
    end
  end
end

private

def build_mapped_value
  mapped_value = MappedValue.new(mapped_value_parameters)
  tag = find_tag
  if tag
    mapped_value.tag = tag
  end

  mapped_value
end

def find_tag
  Tag.find_by_name(params[:tag_name])
end

def mapped_value_parameters
  params.permit(:value)
end

