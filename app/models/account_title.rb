class AccountTitle < ActiveRecord::Base
  belongs_to :account_category
  belongs_to :owner, class_name: 'User'
  has_many :monthly_balances, dependent: :nullify

end
