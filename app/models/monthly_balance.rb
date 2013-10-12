class MonthlyBalance < ActiveRecord::Base
  belongs_to :account_title
  belongs_to :group
end
