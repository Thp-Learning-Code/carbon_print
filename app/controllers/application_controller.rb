class ApplicationController < ActionController::Base
  require 'open-uri'
  require 'json'



 before_action :configure_permitted_parameters, if: :devise_controller?
	 protected
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:email,:password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  # OmniAuth facebook
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
