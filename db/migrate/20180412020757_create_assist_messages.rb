class CreateAssistMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :assist_messages do |t|
      t.string :email
      t.string :subject
      t.text :content
      t.boolean :completed

      t.timestamps
    end
  end
end
