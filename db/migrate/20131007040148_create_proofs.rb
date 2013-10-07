class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.string :title
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
