class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def not_found(message = "Not Found")
      raise ActionController::RoutingError.new(message)
    end
    
    def logged_in?
      redirect_to root_url if !current_user
    end
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    helper_method :not_found, :logged_in?, :current_user
end
