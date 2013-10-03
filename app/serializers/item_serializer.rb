class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :amount, :issue_date
  has_one :owner
  has_one :category
end
