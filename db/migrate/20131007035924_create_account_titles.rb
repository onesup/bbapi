class CreateAccountTitles < ActiveRecord::Migration
  def change
    create_table :account_titles do |t|
      t.references :owner, index: true
      t.references :account_category, index: true
      t.string :title

      t.timestamps
    end
  end
end
