class Bookkeeping < ActiveRecord::Base
  belongs_to :issuer, class_name: 'User'
  belongs_to :writer, class_name: 'User'
  belongs_to :account_title
  belongs_to :group
end
