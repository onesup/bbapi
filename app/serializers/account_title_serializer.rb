class AccountTitleSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :account_category
  has_one :owner
end
