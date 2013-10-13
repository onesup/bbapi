class MonthlyBalanceSerializer < ActiveModel::Serializer
  attributes :id, :b_year, :b_month, :b_amount
  has_one :group
  has_one :account_title
end
