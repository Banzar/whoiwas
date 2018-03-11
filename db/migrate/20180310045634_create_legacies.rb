class CreateLegacies < ActiveRecord::Migration[5.1]
  def change
    create_table :legacies do |t|
      t.string :name
      t.integer :age
      t.date :born_on
      t.date :passed_on
      t.string :country
      t.string :state
      t.string :county
      t.string :city
      t.text :about

      t.timestamps
    end
  end
end
