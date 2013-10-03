class RenameDecriptionFromGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :decription, :description
  end
end
