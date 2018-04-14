class AddColumnsToAssistMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :assist_messages, :solution, :text
    add_column :assist_messages, :read, :boolean, default: false
  end
end
