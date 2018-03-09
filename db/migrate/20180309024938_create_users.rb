class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :country
      t.string :state
      t.string :county
      t.boolean :admin
      t.boolean :super
      t.boolean :legacy

      t.timestamps
    end
  end
end
