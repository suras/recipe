class Card
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  # fields
  field :step_id, type: Integer
  field :c_id, type: Integer
  field :c_type, type: String
  field :c_order, type: Integer
   
  # relations
  embedded_in :step


end
