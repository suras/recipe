json.array!(@recipe_items) do |recipe_item|
  json.extract! recipe_item, :id, :user_id, :name
  json.url recipe_item_url(recipe_item, format: :json)
end
