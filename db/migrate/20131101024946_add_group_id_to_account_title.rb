class AddGroupIdToAccountTitle < ActiveRecord::Migration
  def change
    add_column :account_titles, :group_id, :integer
    add_index  :account_titles, :group_id
  end
end
