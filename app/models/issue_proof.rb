class IssueProof < ActiveRecord::Base
  belongs_to :bookeeping
  belongs_to :proof
end
