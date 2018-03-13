class CreateMemories < ActiveRecord::Migration[5.1]
  def change
    create_table :memories do |t|
      t.string :title
      t.text :what_happened
      t.integer :legacy_id

      t.timestamps
    end
  end
end
