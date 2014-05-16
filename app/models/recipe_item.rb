class RecipeItem
  include Mongoid::Document
  field :user_id, type: Integer
  field :name, type: String

  belongs_to :user
  has_many :steps

end
