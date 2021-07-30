class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_no])
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      works_path
    when Admin
      users_path
    end
  end

end
