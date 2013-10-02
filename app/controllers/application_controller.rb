class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) 
    devise_parameter_sanitizer.for(:sign_in) 
  end

end
