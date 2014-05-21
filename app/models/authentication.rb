class Authentication
  include Mongoid::Document
  field :user_id, type: BSON::ObjectId
  field :provider, type: String
  field :uid, type: String
  field :token, type: String
  field :token_secret, type: String

  # relations
  belongs_to :user
end
