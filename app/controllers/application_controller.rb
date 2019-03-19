class ApplicationController < ActionController::Base
  require 'open-uri'
  require 'json'



 before_action :configure_permitted_parameters, if: :devise_controller?
	 protected
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:email,:password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  def authorize_admin
    if user_signed_in? 
      redirect_to main_app.root_path unless current_user.is_admin  
    elsif !user_signed_in?
      redirect_to root_path
    end
  end

end
