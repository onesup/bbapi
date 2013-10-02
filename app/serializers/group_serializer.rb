class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :decription
  has_one :owner
end
