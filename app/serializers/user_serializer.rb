class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :auth_token

  def id
    object.id.to_s
  end

end
