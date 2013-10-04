class OutlayItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :amount, :issue_date
  has_one :owner
  has_one :category
  has_many :comments
  has_many :tags
end
