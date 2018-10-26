class Users::SessionsController < Devise::SessionsController

  def new
    super
  end

  protected

  def after_sign_in_path_for(resource)
    flash[:success] = "Welcome back #{resource.first_name}!"
    root_path
  end

end