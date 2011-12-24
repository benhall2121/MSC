class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :is_admin?
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end
  
  def require_login
    unless current_user
      redirect_to root_path
    end
  end
  
  def is_admin?
    if current_user
      return current_user.admin?
    else
      return false
    end
  end
  
  def require_admin  
    unless current_user && current_user.admin
    	    redirect_to root_path, :notice => "Only Admins can make changes"
    end
  end
end
