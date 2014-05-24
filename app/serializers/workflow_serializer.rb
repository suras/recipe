class WorkflowSerializer < ActiveModel::Serializer
  attributes :id, :name, :ext_image_url

  def id
    object.id.to_s
  end

end
