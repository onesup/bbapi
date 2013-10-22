class AddAttachmentPictureToProofs < ActiveRecord::Migration
  def self.up
    change_table :proofs do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :proofs, :picture
  end
end
