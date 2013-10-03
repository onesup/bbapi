class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :owner, index: true
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
