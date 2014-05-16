json.array!(@cards) do |card|
  json.extract! card, :id, :step_id, :c_id, :c_type, :c_order
  json.url card_url(card, format: :json)
end
