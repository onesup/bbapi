class AddLikesCountToBookkeeping < ActiveRecord::Migration
  def change
    add_column :bookkeepings, :likes_count, :integer, default: 0
  end
end
