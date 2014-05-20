class Ingredient
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include SearchName
 
  # fields
  field :name, type: String
  field :ext_image_url, type: String
  field :image, type: String
  
  # relation

  # methods



end
