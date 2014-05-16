json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :name, :ext_image_url, :image
  json.url workflow_url(workflow, format: :json)
end
