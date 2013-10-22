class RemovePictureFromProofs < ActiveRecord::Migration
  def change
    remove_column :proofs, :picture, :string
  end
end
