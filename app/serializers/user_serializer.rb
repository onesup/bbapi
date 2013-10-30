class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :auth_token, :avatar_url

  def avatar_url
    object.avatar.url
  end

  def auth_token
    object.authentication_token
  end
end
