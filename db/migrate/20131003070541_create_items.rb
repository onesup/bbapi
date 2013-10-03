class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :owner, index: true
      t.string :content
      t.integer :amount
      t.date :issue_date
      t.references :category, index: true
      t.string :type

      t.timestamps
    end
  end
end
