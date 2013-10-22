class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar, :auth_token

  def auth_token
    object.authentication_token
  end
end
