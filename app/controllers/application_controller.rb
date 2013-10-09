class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user_from_token!
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) 
    devise_parameter_sanitizer.for(:sign_in) 
  end

  def authenticate_user_from_token!
    user_email = request.headers["X-Auth-Email"].presence
    user       = user_email && User.find_by_email(user_email)
    if user && Devise.secure_compare(user.authentication_token, request.headers["X-Auth-Token"])
      sign_in user, store: false
    end
  end
end
