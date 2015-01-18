class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :email, :username, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
  end

  def after_sign_in_path_for(resource)
    if resource.is_profile_complete?
      sign_in(resource)
      root_path
    else
      complete_profile_user_path(resource)
    end
  end

  def check_profile_complete
    if current_user.is_profile_complete?
      redirect_to complete_profile_user_path(current_user)
    end
  end

end
