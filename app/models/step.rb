class Step
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  # fields
  field :comment, type: String
  field :s_order, type: String

  # relations
  embedded_in :recipe_item
  embeds_many :cards
  accepts_nested_attributes_for :cards

end
