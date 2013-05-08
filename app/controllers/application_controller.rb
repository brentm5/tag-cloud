class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  protected

  def authorize_user
    unless current_user
      flash[:error] = 'You must be logged in to access this page.'
      redirect_to root_url
    end
  end

  private

  def current_user
    @current_user ||= get_current_user
  end

  def get_current_user
    if session[:user_id]
      Rails.cache.fetch("CurrentUser/#{session[:user_id]}") do
        User.find_by_id(session[:user_id])
      end
    end
  end
end
