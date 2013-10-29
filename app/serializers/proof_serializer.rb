class ProofSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :bookkeeping_id, :created_at, :updated_at, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :picture_url

  def picture_url
    object.picture.url
  end
end
