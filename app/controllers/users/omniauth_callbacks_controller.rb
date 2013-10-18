class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all    
  	
  	user = User.from_omniauth(request.env['omniauth.auth'])
  	
	  if user.persisted?	    	  	
	    sign_in user
      user.ensure_authentication_token
      render :json=> {:success=>true, :auth_token=>user.authentication_token, :email=>user.email, :id=>user.id}
	  else
	    session['devise.user_attributes'] = user.attributes
	    redirect_to new_user_registration_path
	  end
  end

  alias_method :github, :all
  alias_method :twitter, :all
  alias_method :facebook, :all  
end

