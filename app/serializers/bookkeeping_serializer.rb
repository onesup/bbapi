class BookkeepingSerializer < ActiveModel::Serializer
  attributes :id, :issue_date, :operator, :remark, :amount
  has_one :issuer
  has_one :account_title
end
