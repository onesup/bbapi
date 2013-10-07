class CreateAccountCategories < ActiveRecord::Migration
  def change
    create_table :account_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
