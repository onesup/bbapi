class Bookkeeping < ActiveRecord::Base
  belongs_to :issuer
  belongs_to :account_title
end
