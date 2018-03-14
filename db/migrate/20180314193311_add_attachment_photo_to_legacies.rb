class AddAttachmentPhotoToLegacies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :legacies do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :legacies, :photo
  end
end
