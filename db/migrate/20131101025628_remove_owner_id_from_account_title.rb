class RemoveOwnerIdFromAccountTitle < ActiveRecord::Migration
  def change
    remove_column :account_titles, :owner_id
  end
end
