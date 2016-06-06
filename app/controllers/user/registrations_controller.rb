class User::RegistrationsController < Devise::RegistrationsController

#before_action :configure_permitted_parameters, if: :devise_controller?
 before_filter :configure_permitted_parameters
protected 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:first_name, :name, :email, :password, :password_confirmation)
   
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
     user_params.permit(:first_name, :name, :email, :password, :password_confirmation, :current_password)
     #:name, :email, :password, :password_confirmation, :current_password])
    end
    
  end

end
