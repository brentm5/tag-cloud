class Api::BaseApiController < ActionController::Base
  before_filter :authenticate_user

  private
  def authenticate_user
    if api_token_blank || invalid_api_token
      render json: { error: 'Token is invalid' }, status: 401
    end
  end

  def api_token_blank
    ENV['API_TOKEN'] == nil || ENV['API_TOKEN'] == ''
  end

  def invalid_api_token 
    request.params[:token] != ENV['API_TOKEN']
  end
end
