class AddGroupIdToBookkeepings < ActiveRecord::Migration
  def change
    add_reference :bookkeepings, :group, index: true
  end
end
