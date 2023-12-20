class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :password, :password_confirmation, :current_password])
  end

 private
  def after_sign_in_path_for(resource)
    edit_user_registration_path(current_user) #basically whichever path you think meets your needs
  end
end
