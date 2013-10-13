class MonthlyBalance < ActiveRecord::Base
  belongs_to :group
  belongs_to :account_title
end
