class AddUserIdToLegacies < ActiveRecord::Migration[5.1]
  def change
    add_column :legacies, :user_id, :integer
  end
end
