class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
   def require_login
   unless session[:user_id]
      redirect_to root_path,:notice => " Por favor Registrate primero"    
   end
  end
  
  helper_method :current_user, :require_login
end
