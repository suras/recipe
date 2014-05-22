class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  def id
    object.id.to_s
  end
end
