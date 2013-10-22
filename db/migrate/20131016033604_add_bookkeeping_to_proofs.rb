class AddBookkeepingToProofs < ActiveRecord::Migration
  def change
    add_reference :proofs, :bookkeeping, index: true
  end
end
