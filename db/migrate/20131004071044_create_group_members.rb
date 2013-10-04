class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.references :group, index: true
      t.references :member, index: true

      t.timestamps
    end
  end
end
