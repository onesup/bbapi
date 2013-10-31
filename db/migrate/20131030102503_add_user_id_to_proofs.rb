class AddUserIdToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :user_id, :integer
    add_index :proofs, :user_id
  end
end
