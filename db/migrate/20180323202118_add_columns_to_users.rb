class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moderator2, :boolean, default: false
    add_column :users, :moderator3, :boolean, default: false
    add_column :users, :moderator5, :boolean, default: false
    add_column :users, :moderator10, :boolean, default: false
  end
end
