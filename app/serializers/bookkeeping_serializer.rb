class BookkeepingSerializer < ActiveModel::Serializer
  attributes :id, :issue_date, :operator, :remark, :amount, :content, :created_at, :updated_at
  has_one :issuer
  has_one :writer
  # has_one :group
  has_one :account_title
end
