class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def after_sign_in_path_for(resource)
   user_path(current_user)
  end
  
  
  
  def full_name
     return "#{first_name} #{last_name}".strip
     
  end
  
  protected 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:first_name, :name, :email, :password, :password_confirmation)
   
    end
    devise_parameter_sanitizer.permit(:update) do |user_params|
     user_params.permit(:first_name, :name, :email, :password, :password_confirmation, :curent_password)
     #:name, :email, :password, :password_confirmation, :current_password])
    end
    
  end


end
