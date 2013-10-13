class CreateMonthlyBalances < ActiveRecord::Migration
  def change
    create_table :monthly_balances do |t|
      t.references :group, index: true
      t.references :account_title, index: true
      t.string :b_year, limit: 4
      t.string :b_month, limit: 2
      t.integer :b_amount

      t.timestamps
    end
  end
end
