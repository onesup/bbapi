class AccountCategory < ActiveRecord::Base
  has_many :account_titles, dependent: :destroy
end
