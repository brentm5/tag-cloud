class Api::BaseApiController < ActionController::Base
  before_filter :authenticate_user

  private
  def authenticate_user
    if api_token_not_set || invalid_api_token
      render json: { error: 'Token is invalid' }, status: 401
    end
  end

  def api_token_not_set
    ENV['API_TOKEN'].blank?
  end

  def invalid_api_token 
    request.params[:token] != ENV['API_TOKEN']
  end
end
