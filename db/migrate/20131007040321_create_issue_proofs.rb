class CreateIssueProofs < ActiveRecord::Migration
  def change
    create_table :issue_proofs do |t|
      t.references :bookeeping, index: true
      t.references :proof, index: true

      t.timestamps
    end
  end
end
