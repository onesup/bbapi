class AddContentToBookkeepings < ActiveRecord::Migration
  def change
    add_column :bookkeepings, :content, :text
  end
end
