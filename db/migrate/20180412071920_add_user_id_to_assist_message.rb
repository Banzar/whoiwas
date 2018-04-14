class AddUserIdToAssistMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :assist_messages, :user_id, :integer
  end
end
