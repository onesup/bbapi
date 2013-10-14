class AddWriterToBookkeepings < ActiveRecord::Migration
  def change
    add_reference :bookkeepings, :writer, index: true
  end
end
