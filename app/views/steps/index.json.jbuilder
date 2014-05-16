json.array!(@steps) do |step|
  json.extract! step, :id, :recipe_item_id, :comment
  json.url step_url(step, format: :json)
end
