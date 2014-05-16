class Card
  include Mongoid::Document
  field :step_id, type: Integer
  field :c_id, type: Integer
  field :c_type, type: String
  field :c_order, type: Integer
   
  # relations
  belongs_to :step
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :workflow

end
