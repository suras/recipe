class Step
  include Mongoid::Document
  field :recipe_item_id, type: Integer
  field :comment, type: String

  # relations
  belongs_to :recipe_item
  has_many :cards

end
