class Users::SessionsController < Devise::SessionsController
  before_filter :authenticate_user!, :except => [:create]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email, :id=>resource.id}
      return
    end

    invalid_login_attempt
  end

  def destroy
    current_user.authentication_token = nil;
    current_user.save
    sign_out :user

    render :json=> {:success=>true}
  end


  protected

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your email or password"}, :status=>401
  end
end