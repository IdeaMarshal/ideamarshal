class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def logged_in?
    redirect_to root_url if !current_user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :logged_in?, :current_user
end
