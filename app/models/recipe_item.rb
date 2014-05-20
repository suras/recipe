class RecipeItem
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  #fields
  field :user_id, type: Integer
  field :name, type: String

  belongs_to :user
  embeds_many :steps

end
