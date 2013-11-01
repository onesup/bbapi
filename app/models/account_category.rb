class AccountCategory < ActiveRecord::Base
  has_many :account_titles, dependent: :destroy
  ACCOUNT_CATEGORY_OUTLAY = 1
  ACCOUNT_CATEGORY_INCOME = 2
end
