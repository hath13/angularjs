class AddAttachmentFileUploadToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :file_upload
    end
  end

  def self.down
    remove_attachment :comments, :file_upload
  end
end
