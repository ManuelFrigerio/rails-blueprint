class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  def destroy
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end

  def after_sign_up_path_for(resource)
    flash[:success] = "We have sent a confirmation email to your inbox. Verify your email address to get started."
    root_path 
  end

  def after_inactive_sign_up_path_for(resource)
    flash[:success] = "We have sent a confirmation email to your inbox. Verify your email address to get started."
    root_path
  end

end