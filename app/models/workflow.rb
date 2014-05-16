class Workflow
  include Mongoid::Document
  include SearchName
  
  field :name, type: String
  field :ext_image_url, type: String
  field :image, type: String
  
  # relations
  has_and_belongs_to_many :cards
end
