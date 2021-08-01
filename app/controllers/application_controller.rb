class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    case resource
    when User
      works_path
    when Admin
      users_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      works_path
    when Admin
      users_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_no, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_no])
  end

end
