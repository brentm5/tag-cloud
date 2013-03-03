class UserSessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    if user
      setup_session user
    else
      teardown_session
      flash[:error] = "Login Failed"
    end

    redirect_to root_url
  end

  def error 
    teardown_session
    flash[:error] = 'Invalid Credentials'
    redirect_to root_url
  end

  def logout
    teardown_session
    flash[:notice] = 'You have successfully logged out'
    redirect_to root_url
  end

  private

  def setup_session(user)
    session[:user_id] = user.id
    flash[:notice] = "Successfully logged in #{user.email}"
  end

  def teardown_session
    session[:user_id] = nil
  end
end
