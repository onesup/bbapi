class Bookkeeping < ActiveRecord::Base
  belongs_to :issuer, class_name: 'User'
  belongs_to :writer, class_name: 'User'
  belongs_to :account_title
  belongs_to :group
  has_many :proofs, dependent: :destroy

  validates :group_id, presence: true
  validates :account_title_id, presence: true
  validates :writer_id, presence: true

  accepts_nested_attributes_for :proofs
  
end
