class AddAttachmentPhotoToMemories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :memories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :memories, :photo
  end
end
