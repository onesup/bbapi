class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :owner
  has_many :members, embed: :ids
  has_many :bookkeepings
end
