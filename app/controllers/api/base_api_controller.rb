class Api::BaseApiController < ActionController::Base
  before_filter :authenticate_user

  private
  def authenticate_user
    unless params[:token] == ENV['API_TOKEN']
      render json: { error: 'Token is invalid' }, status: 401
    end
  end
end
