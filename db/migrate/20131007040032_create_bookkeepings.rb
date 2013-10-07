class CreateBookkeepings < ActiveRecord::Migration
  def change
    create_table :bookkeepings do |t|
      t.date :issue_date
      t.references :issuer, index: true
      t.string :operator, limit: 1
      t.references :account_title, index: true
      t.string :remark
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
