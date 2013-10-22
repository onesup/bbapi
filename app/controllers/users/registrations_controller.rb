class Users::RegistrationsController < Devise::RegistrationsController
  wrap_parameters User
  respond_to :json

  skip_before_action :authenticate_scope!, :only => [:update]
  before_action      :authenticate_scope!, :only => [:update]

  def create
    user = User.new(user_params)
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, account_update_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      #respond_with resource, :location => after_update_path_for(resource)
      render :json => resource
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end