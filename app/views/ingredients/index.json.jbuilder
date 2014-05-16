json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :ext_image_url, :image
  json.url ingredient_url(ingredient, format: :json)
end
