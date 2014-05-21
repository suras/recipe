class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  extend SearchName
  
  field :user_id, type: BSON::ObjectId
  field :name, type: String
  field :ext_image_url, type: String
  field :image, type: String
  
  # relations
  belongs_to :user

end
